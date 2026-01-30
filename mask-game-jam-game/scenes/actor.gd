extends CharacterBody2D
var healthbar = 100
var live = 3
@export var speed = 200
var screen_size

func _ready():
	return
	
func _process(delta):
	checkInput(delta)
	screen_size = get_viewport().get_visible_rect().size
	
func checkInput(delta: float):
	if Input.is_action_pressed("moveUp"):
		velocity.y -=delta
	elif Input.is_action_pressed("moveDown"):
		velocity.y +=delta
	elif Input.is_action_pressed("moveLeft"):
		velocity.x -=delta
	elif Input.is_action_pressed("moveRight"):
		velocity.x +=delta
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	move_and_slide()
	#get_node(".").position += velocity * delta
	#get_node(".").position = get_node(".").position.clamp(Vector2.ZERO, screen_size)
