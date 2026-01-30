extends Node
var healthbar = 100;
var live = 3;
var x = 0;
var y = 0;


func _input(event):
	if event is InputEventKey and event.is_pressed():
		checkInput(event)

func checkInput(_event: InputEvent):
		if Input.is_action_pressed("moveUp"):
			y=y+30
#			do stuff
		elif Input.is_action_pressed("moveDown"):
			y=y-30
		elif Input.is_action_pressed("moveLeft"):
			x=x-30
		elif Input.is_action_pressed("moveRight"):
			x=x+30
		
