extends TextureRect
const SAVE_PATH := "user://highscores.json"
const MAX_SCORES := 10
var highscores: Array = []
var highscore1 = 0
var highscore2 = 0
var highscore3 = 0
var highscore4 = 0
var highscore5 = 0
var highscore6 = 0
var highscore7 = 0
var highscore8 = 0
var highscore9 = 0
var highscore10 = 0
var scorearray: Array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
		highscores.reverse()
		print (highscores)
		if highscores.size() >0:
			scorearray = $".".get_children()
			for i in highscores.size():
				print(i)
				#scorearray[i].set_horizontal_alignment(1)
				scorearray[i].text = "Highscore: " + str(highscores[i])
			for j in range(highscores.size(), scorearray.size()):
				scorearray[j].text = "..."
				#scorearray[j].set_horizontal_alignment(1)
			#for e in scorearray.size(): 
				#if highscores.size() < 10 :
					#return
				#scorearray[e].text = "Highscore: " + str(highscores [e])
			#highscore1 = highscores [-1]
			#$Score1.text = "Highscore: " + str(highscore1)
			#highscore2 = highscores [-2]
			#$Score2.text = "Highscore: " + str(highscore2)
			#highscore3 = highscores [-3]
			#$Score3.text = "Highscore: " + str(highscore3)
			#highscore4 = highscores [-4]
			#$Score4.text = "Highscore: " + str(highscore4)
			#highscore5 = highscores [-5]
			#$Score5.text = "Highscore: " + str(highscore5)
			#highscore6 = highscores [-6]
			#$Score6.text = "Highscore: " + str(highscore6)
			#highscore7 = highscores [-7]
			#$Score7.text = "Highscore: " + str(highscore7)
			#highscore8 = highscores [-8]
			#$Score8.text = "Highscore: " + str(highscore8)
			#highscore9 = highscores [-9]
			#$Score9.text = "Highscore: " + str(highscore9)
			#highscore10 = highscores [-10]
			#$Score10.text = "Highscore: " + str(highscore10)
	else:
		highscores = []


# Called every frame. 'delta' is the elapsed time since the previous frame.
	
