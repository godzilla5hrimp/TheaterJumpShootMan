extends CharacterBody2D

@export var bullet_scene: PackedScene
@export var melee_scene: PackedScene
@export var shooter = false

const SPEED = 300.0
var dir = 0

func _ready():
	if position.x <= 0:
		dir = 1
	else:
		dir = -1
		$Sprite2D.flip_h = true


func _physics_process(delta: float) -> void:
	velocity.x = dir * SPEED
	#if not is_on_floor():
		#velocity += get_gravity() * delta
	move_and_slide()


func _on_despawn_timeout() -> void:
	queue_free()


func _on_attack_timer_timeout() -> void:
	if shooter:
		var attack = bullet_scene.instantiate()
		attack.global_position = position
		attack.dir = dir
		get_tree().root.get_node("Main/LevelManager").add_child(attack)
		get_tree().root.get_node("Main/MusicManager/EnemyBullet").play()
	elif shooter == false:
		var attack = melee_scene.instantiate()
		attack.global_position = position
		attack.global_position.x = attack.global_position.x + (dir*150)
		get_tree().root.get_node("Main/LevelManager").add_child(attack)
		get_tree().root.get_node("Main/MusicManager/EnemyMelee").play()
