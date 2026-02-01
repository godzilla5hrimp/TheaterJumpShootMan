extends CharacterBody2D

@export var bullet_scene: PackedScene
@export var melee_scene: PackedScene
@export var shooter = false

@export var enemy_type = "middle_ages"

var speed = 300.0
var dir = 0

var shooting = false
var shoot_count = 0

var health = 2

func _ready():
	#aget_tree().root.get_node("Main/MusicManager").bus("MiddleAgesMusic").mute()
	if position.x <= 0:
		dir = 1
	else:
		dir = -1
		$MiddleAgesMelee.flip_h = true
		$NoireShooter.flip_h = true


func _physics_process(delta: float) -> void:
	velocity.x = dir * speed
	if shooting:
		shoot_bullet()
	move_and_slide()

func shoot_bullet():
	if shoot_count <= 3:
		var attack = bullet_scene.instantiate()
		attack.global_position = position
		attack.dir = dir
		get_tree().root.get_node("Main/LevelManager").add_child(attack)
		get_tree().root.get_node("Main/MusicManager/EnemyBullet").play()
		shoot_count += 1
	if shoot_count > 3:
		speed = 300

func _on_despawn_timeout() -> void:
	queue_free()


func _on_attack_timer_timeout() -> void:
	
	#print($ShooterTimer.is_stopped())
	if shooter:
		speed = 0
		var attack = bullet_scene.instantiate()
		attack.global_position = position
		attack.dir = dir
		attack.z_index = z_index
		get_tree().root.get_node("Main/LevelManager").add_child(attack)
		get_tree().root.get_node("Main/MusicManager/EnemyBullet").play()
		shooting = true
		$ShooterTimer.start()
	elif shooter == false:
		speed = 0
		shooting = false
		$WaitTimerMelee.start()
		var attack = melee_scene.instantiate()
		attack.global_position = position
		attack.global_position.x = attack.global_position.x + (dir*150)
		attack.z_index = z_index
		get_tree().root.get_node("Main/LevelManager").add_child(attack)
		get_tree().root.get_node("Main/MusicManager/EnemyMelee").play()

func change_style(enemy_type):
	if enemy_type == "noire":
		$MiddleAgesMelee.hide()
		$NoireShooter.show()
	if enemy_type == "middle_ages":
		$MiddleAgesMelee.show()
		$NoireShooter.hide()


func calc_dmg():
	health -= 1
	if health <= 0:
		get_tree().root.get_node("Main/UI").get_points_enemy()
		queue_free()

func _on_wait_timer_melee_timeout() -> void:
	speed = 300.0


func _on_shooter_timer_timeout() -> void:
	speed = 300.0


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.get_parent().type == "PlayerBullet":
		#print("GOT HIT!")
		calc_dmg()
