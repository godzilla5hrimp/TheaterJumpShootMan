extends CharacterBody2D
var type = "Melee"

func _on_clean_up_timeout() -> void:
	queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	#print("I hit something!")
	if area.get_parent().name == "Actor":
		area.get_parent()
		queue_free()
