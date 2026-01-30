extends Node
var healthbar = 100;
var live = 3;
var x = 0;
var y = 0;


func _input(event):
	if event is InputEventKey and event.is_pressed():
		checkInput(event)

func checkInput(event: InputEvent):
		if (event.keycode == KEY_UP):
			y+30
#			do stuff
		elif (event.keycode == KEY_DOWN):
			y-30
		elif(event.keycode == KEY_LEFT):
			x-30
		elif(event.keycode == KEY_RIGHT):
			x+30
		
