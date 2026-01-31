extends Control
var HeartAmount = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_actor_hit(lives: Variant, healthbar: Variant) -> void:
	HeartAmount -=1 
	print (HeartAmount)
	if HeartAmount == 2:
		$HeartsUI/Hp3.hide()
	if HeartAmount == 1:
		$HeartsUI/Hp2.hide()
	if HeartAmount == 0:
		$HeartsUI/Hp1.hide()
