extends CharacterBody2D

const ENEMIES_CLASS_NAMES = ["BasicEnemy", "EnemyBullet"]

const SPEED = 600.0
@export var dir = 1

func _physics_process(delta: float) -> void:
	velocity.x = dir * SPEED
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if ENEMIES_CLASS_NAMES.has(get_parent().name):
		queue_free()
