extends TextureRect
const SAVE_PATH := "user://highscores.json"
const MAX_SCORES := 10
var highscores: Array = []
var scorearray: Array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		highscores = []
		print ("no data")
	else:
		var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
		var json_text := file.get_as_text()
		file.close()

		var data = JSON.parse_string(json_text)
		if data and data.has("highscores"):
			highscores = data["highscores"]
			highscores.sort()
			highscores.reverse()
			print (highscores)
			if highscores.size() >0:
				scorearray = $".".get_children()
				for i in 10:
					print(i)
					#scorearray[i].set_horizontal_alignment(1)
					scorearray[i].text = "Highscore: " + str(highscores[i])
				for j in range(highscores.size(), scorearray.size()):
					scorearray[j].text = "..."
		else:
			highscores = []	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
	
