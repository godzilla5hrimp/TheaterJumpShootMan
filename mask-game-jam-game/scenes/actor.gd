extends CharacterBody2D

var healthbar = 100
var lives = 3
@export var speed = 400
var screen_size
signal hit(lives, healthbar)
signal mask_changed(mask_changed)
var masks = ["block", "attack", "movement"]
var current_mask = 0

signal puppets
signal middle_ages
signal noire

func _ready():	
	#print("masks size: ", masks.size())
	change_mask_texture()
	return
	
func _physics_process(delta: float):
	screen_size = get_viewport().get_visible_rect().size
	check_input(delta)
	
func change_mask_next ():
	if ((current_mask + 1) >= masks.size()):
		current_mask = 0
	else:
		current_mask = current_mask+1

func change_mask_texture ():
	match current_mask:
		0:
			$MiddleAgesMask.show()
			$NoirMask.hide()
			$PuppetMask.hide()
			emit_signal("middle_ages")
		1:
			$MiddleAgesMask.hide()
			$NoirMask.show()
			$PuppetMask.hide()
			emit_signal("noire")
		2:
			$MiddleAgesMask.hide()
			$NoirMask.hide()
			$PuppetMask.show()
			emit_signal("puppets")

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
		change_mask_texture()
		mask_changed.emit(masks[current_mask])
	if Input.is_action_just_pressed("change_mask_previous"):
		change_mask_previous()
		change_mask_texture()
		mask_changed.emit(masks[current_mask])
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	move_and_slide()	

func _on_hitbox_area_entered(area: Area2D) -> void:
	#print("hit")
	#print(area.get_parent().name)
	if area.get_parent().name == "MeleeAttack" or area.get_parent().name == "EnemyBullet":
		healthbar = healthbar-2
		print(0)
		if (healthbar <= 0):
			lives = lives-1
		hit.emit(lives, healthbar)
	#		todo: add invinsibility timer after losing a life maybe?
