extends CharacterBody2D

var healthbar = 100
var live = 3
@export var speed = 400
var screen_size
signal hit
signal mask_changed
var masks = ["block", "attack", "movement"]
var current_mask = 0

func _ready():
	print("masks size: ", masks.size())
	return
	
func _physics_process(delta: float):
	#screen_size = get_viewport().get_visible_rect().size
	check_input(delta)
	
func change_mask_next ():
	if ((current_mask + 1) >= masks.size()):
		current_mask = 0
	else:
		current_mask = current_mask+1

func change_mask_previous ():
	if (current_mask - 1 < 0):
		current_mask = masks.size()-1
	else:
		current_mask = current_mask-1

func check_input(_delta: float):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("moveUp"):
		velocity.y -=1 
	if Input.is_action_pressed("moveDown"):
		velocity.y +=1
	if Input.is_action_pressed("moveLeft"):
		velocity.x -=1
	if Input.is_action_pressed("moveRight"):
		velocity.x +=1
	if Input.is_action_just_pressed("change_mask_next"):
		change_mask_next()
		mask_changed.emit()
		print("mask ", masks[current_mask], " changed")
	if Input.is_action_just_pressed("change_mask_previous"):
		change_mask_previous()
		mask_changed.emit()
		print("mask ", masks[current_mask], " changed")
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
