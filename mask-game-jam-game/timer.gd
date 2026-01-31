extends Timer
signal HighscoreTimeout

func _on_timer_timeout():
	HighscoreTimeout.emit()
	print("timeout")
