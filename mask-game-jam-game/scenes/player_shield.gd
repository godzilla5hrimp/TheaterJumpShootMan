extends CharacterBody2D
var type = "Shield"

func _on_clean_up_timeout() -> void:
	queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("SHIELD ATTACK!")
	if area.get_parent().type == "Bullet" or area.get_parent().type == "Melee":
		area.get_parent().queue_free()
