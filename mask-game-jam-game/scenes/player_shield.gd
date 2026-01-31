extends CharacterBody2D

func _on_clean_up_timeout() -> void:
	queue_free()
