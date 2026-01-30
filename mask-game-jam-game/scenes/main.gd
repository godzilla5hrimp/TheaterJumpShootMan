extends Node2D

func _process(_delta: float):
	if Input.is_action_just_pressed("close_button"):
		get_tree().quit()
	if Input.is_action_just_pressed("restart"):
		pass
		#get_tree().change_scene("res://scenes/level_base.tscn")
