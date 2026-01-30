extends Node2D
@export var middle_ages_scene: PackedScene
@export var noire_scene: PackedScene
@export var puppet_scene: PackedScene

var current_scene
func _ready():
	current_scene = middle_ages_scene.instantiate()
	get_tree().root.add_child.call_deferred(current_scene)

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("change_level"):
		current_scene = puppet_scene.instantiate()
		get_tree().root.add_child.call_deferred(current_scene)
