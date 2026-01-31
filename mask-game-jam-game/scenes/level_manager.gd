extends Node2D
@export var middle_ages_scene: PackedScene
@export var noire_scene: PackedScene
@export var puppet_scene: PackedScene

signal puppets
signal middle_ages
signal noire

var current_scene
func _ready():
	current_scene = middle_ages_scene.instantiate()
	get_tree().root.add_child.call_deferred(current_scene)
	print(current_scene.name)
	

func change_enemy_to_middle_ages():
	var enemies = get_tree().get_nodes_in_group("enemies")
	for enemy in enemies:
		enemy.shooter = false
		

func change_enemy_to_noire():
	var enemies = get_tree().get_nodes_in_group("enemies")
	for enemy in enemies:
		enemy.shooter = true


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("change_noire") and current_scene.name != "Noire":
		delete_level()
		current_scene = noire_scene.instantiate()
		get_tree().root.add_child.call_deferred(current_scene)
		change_enemy_to_noire()
		emit_signal("noire")
	elif Input.is_action_just_pressed("change_middle_ages") and current_scene.name != "MiddleAges":
		delete_level()
		current_scene = middle_ages_scene.instantiate()
		get_tree().root.add_child.call_deferred(current_scene)
		change_enemy_to_middle_ages()
		emit_signal("middle_ages")
	elif Input.is_action_just_pressed("change_puppets") and current_scene.name != "Puppets":
		delete_level()
		current_scene = puppet_scene.instantiate()
		get_tree().root.add_child.call_deferred(current_scene)
		emit_signal("puppets")

func delete_level():
	if get_tree().root.get_node_or_null("MiddleAges"):
		get_tree().root.get_node("MiddleAges").queue_free()
	if get_tree().root.get_node_or_null("Noire"):
		get_tree().root.get_node("Noire").queue_free()
	if get_tree().root.get_node_or_null("Puppets"):
		get_tree().root.get_node("Puppets").queue_free()
