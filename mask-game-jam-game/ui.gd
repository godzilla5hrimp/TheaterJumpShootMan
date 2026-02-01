extends Control
var PosCurrentMask = Vector2(1600,110)
var SizeCurrentMask = Vector2(1.4,1.4)
var PosPreviousMask = Vector2(1450,130)
var SizePreviousMask = Vector2(1,1)
var PosNextMask = Vector2(1750,130)
var SizeNextMask = Vector2(1,1)
var Score := 0
var ElapsedTime = 0
var Highscore := 0
const SAVE_PATH := "user://highscores.json"
const MAX_SCORES := 10
var highscores: Array = []

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
		print (highscores)
		if highscores.size() >0:
			Highscore = highscores [-1]
		$HighscoreLabel.text = "Highscore: " + str(Highscore)
	else:
		highscores = []

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ReduceUIHearts"):
		highscores.append(Highscore)
		var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
		var data := {
			"highscores": highscores
		}
		file.store_string(JSON.stringify(data))
		file.close()
		print("data saved")


func _on_actor_hit(lives: Variant, healthbar: Variant) -> void: 
	if lives == 5:
		$HeartsUI/Hp6.hide()
	if lives == 4:
		$HeartsUI/Hp5.hide()
	if lives == 3:
		$HeartsUI/Hp4.hide()
	if lives == 2:
		$HeartsUI/Hp3.hide()
	if lives == 1:
		$HeartsUI/Hp2.hide()
	if lives == 0:
		$HeartsUI/Hp1.hide()


func _on_actor_mask_changed(mask_changed: Variant) -> void:
	if mask_changed == "block":
		$"Mask Swap UI/MaskSwapBlockmask".position = PosCurrentMask #block/Midevial
		$"Mask Swap UI/MaskSwapBlockmask".scale = SizeCurrentMask #block/Midevial
		$"Mask Swap UI/MaskSwapMovemask".position = PosPreviousMask #Movement
		$"Mask Swap UI/MaskSwapMovemask".scale = SizePreviousMask #Movement
		$"Mask Swap UI/MaskSwapAttackmask".position = PosNextMask #Attack
		$"Mask Swap UI/MaskSwapAttackmask".scale = SizeNextMask #Attack
	if mask_changed == "attack":
		$"Mask Swap UI/MaskSwapAttackmask".position = PosCurrentMask
		$"Mask Swap UI/MaskSwapAttackmask".scale = SizeCurrentMask
		$"Mask Swap UI/MaskSwapBlockmask".position = PosPreviousMask
		$"Mask Swap UI/MaskSwapBlockmask".scale = SizePreviousMask
		$"Mask Swap UI/MaskSwapMovemask".position = PosNextMask
		$"Mask Swap UI/MaskSwapMovemask".scale = SizeNextMask
	if mask_changed == "movement":
		$"Mask Swap UI/MaskSwapMovemask".position = PosCurrentMask
		$"Mask Swap UI/MaskSwapMovemask".scale = SizeCurrentMask
		$"Mask Swap UI/MaskSwapAttackmask".position = PosPreviousMask
		$"Mask Swap UI/MaskSwapAttackmask".scale = SizePreviousMask
		$"Mask Swap UI/MaskSwapBlockmask".position = PosNextMask
		$"Mask Swap UI/MaskSwapBlockmask".scale = SizeNextMask
		

func get_points_enemy():
	print("YAY POINTS")
	Score += 10
	$Label.text = "Score: " + str(Score)
	if Score > Highscore:
		Highscore = Score
		$HighscoreLabel.text = "Highscore: " + str(Score)

func _on_timer_timeout() -> void:
	ElapsedTime +=1
	Score += 5 + (.3*ElapsedTime)
	$Label.text = "Score: " + str(Score)
	if Score > Highscore:
		Highscore = Score
		$HighscoreLabel.text = "Highscore: " + str(Score)
	
func change_highscore():
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	highscores.append(Score)
	var data := {
			"highscores": highscores
		}

	file.store_string(JSON.stringify(data))
	file.close()
	print("data saved")
