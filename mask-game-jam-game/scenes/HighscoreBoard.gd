extends TextureRect
const SAVE_PATH := "user://highscores.json"
const MAX_SCORES := 10
var highscores: Array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

	if not FileAccess.file_exists(SAVE_PATH):
		highscores = []
		print ("no data")
		return

	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	var json_text := file.get_as_text()
	print(json_text)
	file.close()

	var data = JSON.parse_string(json_text)
	if data and data.has("highscores"):
		highscores = data["highscores"]
		highscores.sort()
		print (highscores)
	else:
		highscores = []
