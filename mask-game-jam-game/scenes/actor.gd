extends CharacterBody2D
var healthbar = 100
var live = 3
@export var speed = 400
var screen_size

func _ready():
	return
	
func _physics_process(delta: float):
	checkInput(delta)
	screen_size = get_viewport().get_visible_rect().size
	
func checkInput(delta: float):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("moveUp"):
		velocity.y -=1 
	if Input.is_action_pressed("moveDown"):
		velocity.y +=1
	if Input.is_action_pressed("moveLeft"):
		velocity.x -=1
	if Input.is_action_pressed("moveRight"):
		velocity.x +=1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	move_and_slide()
	#position += velocity * delta
	#position = get_node(".").position.clamp(Vector2.ZERO, screen_size)
