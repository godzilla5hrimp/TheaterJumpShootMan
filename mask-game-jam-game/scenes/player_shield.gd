extends CharacterBody2D
var type = "Shield"

func _on_clean_up_timeout() -> void:
	queue_free()
