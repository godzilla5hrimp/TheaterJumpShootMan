extends CharacterBody2D


func _on_clean_up_timeout() -> void:
	queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().name == "Actor":
		queue_free()
