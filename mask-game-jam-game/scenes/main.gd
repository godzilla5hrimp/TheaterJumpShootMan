extends Node2D

var current_stage = "noire"
@export var player_scene: PackedScene

func _ready() -> void:
	pass
	
func spawn_player() :
	return

func _process(_delta: float):
	#print(get_incoming_connections())
	if Input.is_action_just_pressed("close_button"):
		get_tree().quit()

func change_enemy_type():
	$EnemySpawner.enemy_type = current_stage

func _on_level_manager_middle_ages() -> void:
	current_stage = "middle_ages"
	change_enemy_type()

func _on_level_manager_noire() -> void:
	current_stage = "noire"
	change_enemy_type()


func _on_level_manager_puppets() -> void:
	current_stage = "puppets"
	change_enemy_type()


func _on_actor_hit(lives: Variant, healthbar: Variant) -> void:
	#print ("lose hp")
	pass

func _on_actor_died() -> void:
	print("die pop up")
	$YouDiedScreen.visible = true
	$YouDiedScreen.show()
	$Actor.queue_free()
	$EnemySpawner.queue_free()
	$UI.change_highscore()
	$UI/Label/Timer.stop()
