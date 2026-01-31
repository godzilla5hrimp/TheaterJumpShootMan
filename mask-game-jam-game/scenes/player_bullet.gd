extends CharacterBody2D

const SPEED = 600.0
@export var dir = 1

func _physics_process(delta: float) -> void:
	velocity.x = dir * SPEED
	move_and_slide()
	
func _on_clean_up_timeout() -> void:
	pass # Replace with function body.

func _on_area_2d_area_entered(area: Area2D) -> void:
	print(area.get_parent().name)
	if area.get_parent().name == "BasicEnemy":
		queue_free()
