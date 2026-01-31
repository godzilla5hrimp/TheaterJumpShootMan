extends CharacterBody2D

@export var bullet_scene: PackedScene

const SPEED = 300.0
var dir = 0

func _ready():
	if position.x <= 0:
		dir = 1
	else:
		dir = -1


func _physics_process(delta: float) -> void:
	
	velocity.x = dir * SPEED

	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()


func _on_despawn_timeout() -> void:
	print("I deleted myself!")
	queue_free()


func _on_attack_timer_timeout() -> void:
	var bullet = bullet_scene.instantiate()
	bullet.global_position = position
	bullet.dir = dir
	get_tree().root.get_node("Main/LevelManager").add_child(bullet)
