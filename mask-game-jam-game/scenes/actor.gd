extends CharacterBody2D

var healthbar = 100
var lives = 6
@export var speed = 400
@export var player_bullet : PackedScene
@export var player_shield : PackedScene
var screen_size
signal hit(lives, healthbar)
signal mask_changed(mask_changed)
var masks = ["block", "attack", "movement"]
var current_mask = 0
var dir = 1
var can_shoot = true
var have_shield = false
var current_shield = null

signal puppets
signal middle_ages
signal noire

func _ready():	
	change_mask_texture()
	return
	
func _physics_process(delta: float):
	
	print("lives ", lives)
	#print("healthbar", healthbar)
	
	screen_size = get_viewport().get_visible_rect().size
	check_input(delta)
	if current_shield:
		current_shield.global_position = position + Vector2(dir * 50, 0)
	
func change_mask_next ():
	if ((current_mask + 1) >= masks.size()):
		current_mask = 0
	else:
		current_mask = current_mask+1

func change_mask_texture ():
	match current_mask:
		0:
			can_shoot = false
			$MiddleAgesMask.show()
			$NoirMask.hide()
			$PuppetMask.hide()
			speed = 400
			emit_signal("middle_ages")
		1:
			can_shoot = true
			$MiddleAgesMask.hide()
			$NoirMask.show()
			$PuppetMask.hide()
			speed = 400
			emit_signal("noire")
		2:
			can_shoot = false
			$MiddleAgesMask.hide()
			$NoirMask.hide()
			$PuppetMask.show()
			speed = 800
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
		dir = -1
	if Input.is_action_pressed("moveRight"):
		velocity.x +=1
		dir = 1
	if Input.is_action_just_pressed("change_mask_next"):
		change_mask_next()
		change_mask_texture()
		mask_changed.emit(masks[current_mask])
	if Input.is_action_just_pressed("change_mask_previous"):
		change_mask_previous()
		change_mask_texture()
		mask_changed.emit(masks[current_mask])
	if Input.is_action_pressed("player_shoot") && current_mask == 1 && can_shoot:
		#print("SHOOTING AROUND")
		var attack = player_bullet.instantiate()
		print(attack)
		attack.global_position = position + Vector2(dir*50, 0)
		attack.dir = dir
		get_tree().root.get_node("Main/LevelManager").add_child(attack)
		can_shoot = false
		$Timer.start()
	if Input.is_action_pressed("player_shield") and current_mask == 0 and !have_shield:
		#print("shielded")
		have_shield = true
		current_shield = player_shield.instantiate()
		#$ShieldTimer.start() 
		current_shield.global_position = position + Vector2(dir*50, 0)
		get_tree().root.get_node("Main/LevelManager").add_child(current_shield)
	if not Input.is_action_pressed("player_shield") and have_shield:
		have_shield = false
		if current_shield:
			current_shield.queue_free()
			current_shield = null
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	if current_shield:
		current_shield.global_position = position + Vector2(dir * 50, 0)
		var sprite := current_shield.get_node("Sprite2D") as Sprite2D
		sprite.flip_h = (dir == 1)
	move_and_slide()

func track_shield(shield):
	shield.global_position = position + Vector2(dir*50, 0)
	shield.move_and_slide()

func _on_hitbox_area_entered(area: Area2D) -> void:
	var type = "Melee"
	if area.get_parent().type =="Melee" or area.get_parent().type == "Bullet":
		healthbar = healthbar-2
		lives = lives - 1
		hit.emit(lives, healthbar)
	#		todo: add invinsibility timer after losing a life maybe?
	
func _on_timer_timeout() -> void:
	can_shoot = true


#func _on_shield_timer_timeout() -> void:
	#have_shield = false
	#if current_shield:
		#current_shield.queue_free()
		#current_shield = null
