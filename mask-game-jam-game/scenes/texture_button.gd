extends TextureButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("button loaded")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	print("moving back to main menu")
	get_tree().change_scene_to_file("res://main_menu.tscn")
