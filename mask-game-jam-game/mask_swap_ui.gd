extends Control
var MaskState := 1
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
		if Input.is_action_just_pressed("SwapMaskForward"):
			#print ("movemask")
			MaskState += 1
			if MaskState >=3: MaskState = 0
			#print(MaskState)
			if MaskState == 0:
				$MaskSwapRedmask.position = PosCurrentMask
				$MaskSwapRedmask.scale = SizeCurrentMask
				$MaskSwapBluemask.position = PosPreviousMask
				$MaskSwapBluemask.scale = SizePreviousMask
				$MaskSwapGreenmask.position = PosNextMask
				$MaskSwapGreenmask.scale = SizeNextMask
			if MaskState == 1:
				$MaskSwapGreenmask.position = PosCurrentMask
				$MaskSwapGreenmask.scale = SizeCurrentMask
				$MaskSwapRedmask.position = PosPreviousMask
				$MaskSwapRedmask.scale = SizePreviousMask
				$MaskSwapBluemask.position = PosNextMask
				$MaskSwapBluemask.scale = SizeNextMask
			if MaskState == 2:
				$MaskSwapBluemask.position = PosCurrentMask
				$MaskSwapBluemask.scale = SizeCurrentMask
				$MaskSwapGreenmask.position = PosPreviousMask
				$MaskSwapGreenmask.scale = SizePreviousMask
				$MaskSwapRedmask.position = PosNextMask
				$MaskSwapRedmask.scale = SizeNextMask
