extends Node2D

@export var enemy_scene: PackedScene
var left = true

func spawn_enemy():
	var enemy = enemy_scene.instantiate()
	
	if left:
		enemy.global_position = Vector2(-140.0, 920.0)
		left = false
	elif left == false:
		enemy.global_position = Vector2(2053.0, 920.0)
		left = true
	get_tree().root.get_node("Main/LevelManager").add_child(enemy)

func _on_timer_timeout() -> void:
	spawn_enemy()
