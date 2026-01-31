extends Node2D

var current_stage = "middle_ages"

func _process(_delta: float):
	if Input.is_action_just_pressed("close_button"):
		get_tree().quit()

func change_enemy_type():
	$EnemySpawner.enemy_type = current_stage

func _on_level_manager_middle_ages() -> void:
	current_stage = "middle_ages"
	change_enemy_type()

func _on_level_manager_noire() -> void:
	current_stage = "noire"
	change_enemy_type()


func _on_level_manager_puppets() -> void:
	current_stage = "puppets"
	change_enemy_type()
