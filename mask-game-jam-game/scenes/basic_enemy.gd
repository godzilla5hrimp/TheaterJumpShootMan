extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

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
