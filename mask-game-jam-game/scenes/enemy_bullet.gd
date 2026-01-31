extends CharacterBody2D


const SPEED = 600.0

@export var dir = 1


func _physics_process(delta: float) -> void:
	
	velocity.x = dir * SPEED
	move_and_slide()


func _on_clean_up_timeout() -> void:
	pass # Replace with function body.
