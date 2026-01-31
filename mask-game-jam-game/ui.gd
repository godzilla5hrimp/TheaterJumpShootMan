extends Control
var HeartAmount = 3
var PosCurrentMask = Vector2(1600,110)
var SizeCurrentMask = Vector2(1.4,1.4)
var PosPreviousMask = Vector2(1450,130)
var SizePreviousMask = Vector2(1,1)
var PosNextMask = Vector2(1750,130)
var SizeNextMask = Vector2(1,1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_actor_hit(lives: Variant, healthbar: Variant) -> void: 
	#print (lives)
	if lives == 2:
		$HeartsUI/Hp3.hide()
	if lives == 1:
		$HeartsUI/Hp2.hide()
	if lives == 0:
		$HeartsUI/Hp1.hide()


func _on_actor_mask_changed(mask_changed: Variant) -> void:
	#eprint ("movemask")
	#print (mask_changed)
	if mask_changed == "block":
		$"Mask Swap UI/MaskSwapBlockmask".position = PosCurrentMask #block/Midevial
		$"Mask Swap UI/MaskSwapBlockmask".scale = SizeCurrentMask #block/Midevial
		$"Mask Swap UI/MaskSwapMovemask".position = PosPreviousMask #Movement
		$"Mask Swap UI/MaskSwapMovemask".scale = SizePreviousMask #Movement
		$"Mask Swap UI/MaskSwapAttackmask".position = PosNextMask #Attack
		$"Mask Swap UI/MaskSwapAttackmask".scale = SizeNextMask #Attack
	if mask_changed == "attack":
		$"Mask Swap UI/MaskSwapAttackmask".position = PosCurrentMask
		$"Mask Swap UI/MaskSwapAttackmask".scale = SizeCurrentMask
		$"Mask Swap UI/MaskSwapBlockmask".position = PosPreviousMask
		$"Mask Swap UI/MaskSwapBlockmask".scale = SizePreviousMask
		$"Mask Swap UI/MaskSwapMovemask".position = PosNextMask
		$"Mask Swap UI/MaskSwapMovemask".scale = SizeNextMask
	if mask_changed == "movement":
		$"Mask Swap UI/MaskSwapMovemask".position = PosCurrentMask
		$"Mask Swap UI/MaskSwapMovemask".scale = SizeCurrentMask
		$"Mask Swap UI/MaskSwapAttackmask".position = PosPreviousMask
		$"Mask Swap UI/MaskSwapAttackmask".scale = SizePreviousMask
		$"Mask Swap UI/MaskSwapBlockmask".position = PosNextMask
		$"Mask Swap UI/MaskSwapBlockmask".scale = SizeNextMask
