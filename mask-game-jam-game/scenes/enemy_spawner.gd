extends Node2D

@export var enemy_scene: PackedScene
@export var enemy_type = "middle_ages"
var left = true
var rng = RandomNumberGenerator.new()

func spawn_enemy():
	var enemy = enemy_scene.instantiate()
	if enemy_type == "middle_ages":
		enemy.shooter = false
	if enemy_type == "noire":
		enemy.shooter = true
	if enemy_type == "puppets":
		if rng.randf_range(0, 100.0) < 49.0:
			enemy.shooter = true
		else:
			enemy.shooter = false
	var choose_pos = rng.randi_range(0,2) 
	print(choose_pos)
	if left:
		if choose_pos == 0:
			enemy.global_position = Vector2(-140.0, 400.0)
		if choose_pos == 1:
			enemy.global_position = Vector2(-140.0, 600.0)
		if choose_pos == 2:
			enemy.global_position = Vector2(-140.0, 800.0)
		left = false
	elif left == false:
		enemy.global_position = Vector2(2053.0, 800.0)
		left = true
	get_tree().root.get_node("Main/LevelManager").add_child(enemy)
	print(enemy.global_position)

func _on_timer_timeout() -> void:
	spawn_enemy()
