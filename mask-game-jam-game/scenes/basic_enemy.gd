extends CharacterBody2D

@export var bullet_scene: PackedScene
@export var melee_scene: PackedScene
@export var shooter = false

var speed = 300.0
var dir = 0

var shooting = false
var shoot_count = 0

func _ready():
	if position.x <= 0:
		dir = 1
	else:
		dir = -1
		$Sprite2D.flip_h = true


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

func _on_despawn_timeout() -> void:
	queue_free()


func _on_attack_timer_timeout() -> void:
	speed = 0
	print($ShooterTimer.is_stopped())
	if shooter:
		shooting = true
		$ShooterTimer.start()
	elif shooter == false:
		shooting = false
		$WaitTimerMelee.start()
		var attack = melee_scene.instantiate()
		attack.global_position = position
		attack.global_position.x = attack.global_position.x + (dir*150)
		get_tree().root.get_node("Main/LevelManager").add_child(attack)
		get_tree().root.get_node("Main/MusicManager/EnemyMelee").play()

func _on_wait_timer_melee_timeout() -> void:
	speed = 300.0


func _on_shooter_timer_timeout() -> void:
	shooting = false;
	shoot_count = 0
	speed = 300.0


func _on_distance_timer_timeout() -> void:
	pass # Replace with function body.
