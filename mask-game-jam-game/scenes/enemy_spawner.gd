extends Node2D

@export var enemy_scene: PackedScene
@export var enemy_type = "middle_ages"
var left = true
var rng = RandomNumberGenerator.new()

func spawn_enemy():
	var enemy = enemy_scene.instantiate()
	if enemy_type == "middle_ages":
		enemy.shooter = false
		enemy.change_style("middle_ages")
	if enemy_type == "noire":
		enemy.shooter = true
		enemy.change_style("noire")
	if enemy_type == "puppets":
		if rng.randf_range(0, 100.0) < 49.0:
			enemy.shooter = true
		else:
			enemy.shooter = false
	var choose_pos = rng.randi_range(0,2) 
	
	if left:
		if choose_pos == 0:
			enemy.global_position = Vector2(-140.0, 600.0)
		if choose_pos == 1:
			enemy.global_position = Vector2(-140.0, 700.0)
		if choose_pos == 2:
			enemy.global_position = Vector2(-140.0, 800.0)

		left = false
	elif left == false:
		if choose_pos == 0:
			enemy.global_position = Vector2(2053.0, 600.0)
		if choose_pos == 1:
			enemy.global_position = Vector2(2053.0, 700.0)
		if choose_pos == 2:
			enemy.global_position = Vector2(2053.0, 800.0)
		left = true
	get_tree().root.get_node("Main/LevelManager").add_child(enemy)
func _on_timer_timeout() -> void:
	print(get_tree().get_nodes_in_group("enemies").size())
	if get_tree().get_nodes_in_group("enemies").size() <= 10:
		spawn_enemy()
