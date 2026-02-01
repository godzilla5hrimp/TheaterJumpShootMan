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

func change_enemy_to_middle_ages():
	var enemies = get_tree().get_nodes_in_group("enemies")
	for enemy in enemies:
		enemy.shooter = false
		enemy.change_style("middle_ages")
		

func change_enemy_to_noire():
	var enemies = get_tree().get_nodes_in_group("enemies")
	for enemy in enemies:
		enemy.shooter = true
		enemy.change_style("noire")

func change_enemy_to_puppets():
	var enemies = get_tree().get_nodes_in_group("enemies")
	for enemy in enemies:
		enemy.shooter = true
		enemy.change_style("puppets")


func _physics_process(delta: float) -> void:
	pass
	#if Input.is_action_just_pressed("change_noire") and current_scene.name != "Noire":
		#delete_level()
		#print("eneter noir")
		#current_scene = noire_scene.instantiate()
		#get_tree().root.add_child.call_deferred(current_scene)
		#change_enemy_to_noire()
		#emit_signal("noire")
	#elif Input.is_action_just_pressed("change_middle_ages") and current_scene.name != "MiddleAges":
		#delete_level()
		#current_scene = middle_ages_scene.instantiate()
		#get_tree().root.add_child.call_deferred(current_scene)
		#change_enemy_to_middle_ages()
		#emit_signal("middle_ages")
	#elif Input.is_action_just_pressed("change_puppets") and current_scene.name != "Puppets":
		#delete_level()
		#current_scene = puppet_scene.instantiate()
		#get_tree().root.add_child.call_deferred(current_scene)
		#emit_signal("puppets")

func change_level_noire():
	#print("enter noir")
	current_scene = noire_scene.instantiate()
	get_tree().root.add_child.call_deferred(current_scene)
	change_enemy_to_noire()
	emit_signal("noire")

func delete_level():
	#print("delete level")
	if get_tree().root.get_node_or_null("MiddleAges"):
		get_tree().root.get_node("MiddleAges").queue_free()
	if get_tree().root.get_node_or_null("Noire"):
		get_tree().root.get_node("Noire").queue_free()
	if get_tree().root.get_node_or_null("Puppets"):
		get_tree().root.get_node("Puppets").queue_free()


func _on_actor_middle_ages() -> void:
	delete_level()
	current_scene = middle_ages_scene.instantiate()
	get_tree().root.add_child.call_deferred(current_scene)
	change_enemy_to_middle_ages()
	emit_signal("middle_ages")


func _on_actor_noire() -> void:
	delete_level()
	#print("eneter noir")
	current_scene = noire_scene.instantiate()
	get_tree().root.add_child.call_deferred(current_scene)
	change_enemy_to_noire()
	emit_signal("noire")


func _on_actor_puppets() -> void:
	delete_level()
	current_scene = puppet_scene.instantiate()
	get_tree().root.add_child.call_deferred(current_scene)
	emit_signal("puppets")
