extends CharacterBody2D

var healthbar = 100
var live = 3
@export var speed = 400
var screen_size
signal hit

func _ready():
	print("actor created")
	position = Vector2(100, 100);
	return
	
func _physics_process(delta: float):
	#screen_size = get_viewport().get_visible_rect().size
	checkInput(delta)
	
func checkInput(_delta: float):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("moveUp"):
		print("going up")
		velocity.y -=1 
	if Input.is_action_pressed("moveDown"):
		print("going down")
		velocity.y +=1
	if Input.is_action_pressed("moveLeft"):
		print("going left")
		velocity.x -=1
	if Input.is_action_pressed("moveRight"):
		print("going right")
		velocity.x +=1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	move_and_slide()
	#position += velocity * delta
#	todo: remove that, Ralph is handling out of bounds collision logic
	var collision_shape_rect = get_node("%CollisionMovementShape").shape.get_rect()
	position = position.clamp(collision_shape_rect.position, collision_shape_rect.end)


func _on_hitbox_body_entered(body: Node2D) -> void:
	healthbar =- 25
	hit.emit()
