extends Node2D

var current_stage = "noire"
@export var player_scene: PackedScene

func _ready() -> void:
	pass
	#AudioServer.set_bus_mute(0, not AudioServer.is_bus_mute(0))
	#var player = player_scene.instantiate()
	#player.position = $StartPos.position
	#get_tree().root.get_node("Main/").add_child(player)
	#print(player.position)
func spawn_player() :
	return

func _process(_delta: float):
	#print(get_incoming_connections())
	#print(current_stage)
	if Input.is_action_just_pressed("close_button"):
		get_tree().quit()

func change_enemy_type():
	$EnemySpawner.enemy_type = current_stage

func _on_level_manager_middle_ages() -> void:
	current_stage = "middle_ages"
	AudioServer.set_bus_mute(AudioServer.get_bus_index("MiddleAgesMusic"), false)
	AudioServer.set_bus_mute(AudioServer.get_bus_index("NoireMusic"), true) 
	AudioServer.set_bus_mute(AudioServer.get_bus_index("PuppetMusic"), false) 
	#$MusicManager/MiddleAgesMusic.play()
	#$MusicManager/NoireMusic.stop()
	#$MusicManager/PuppetMusic.stop()
	change_enemy_type()

func _on_level_manager_noire() -> void:
	current_stage = "noire"
	AudioServer.set_bus_mute(AudioServer.get_bus_index("MiddleAgesMusic"), true)
	AudioServer.set_bus_mute(AudioServer.get_bus_index("NoireMusic"), false) 
	AudioServer.set_bus_mute(AudioServer.get_bus_index("PuppetMusic"), true) 
	#$MusicManager/MiddleAgesMusic.stop()
	#$MusicManager/NoireMusic.play()
	#$MusicManager/PuppetMusic.stop()
	change_enemy_type()


func _on_level_manager_puppets() -> void:
	current_stage = "puppets"
	AudioServer.set_bus_mute(AudioServer.get_bus_index("MiddleAgesMusic"), true)
	AudioServer.set_bus_mute(AudioServer.get_bus_index("NoireMusic"), true) 
	AudioServer.set_bus_mute(AudioServer.get_bus_index("PuppetMusic"), false) 
	#$MusicManager/MiddleAgesMusic.stop()
	#$MusicManager/NoireMusic.stop()
	#$MusicManager/PuppetMusic.play()
	change_enemy_type()


func _on_actor_hit(lives: Variant, healthbar: Variant) -> void:
	#print ("lose hp")
	pass
