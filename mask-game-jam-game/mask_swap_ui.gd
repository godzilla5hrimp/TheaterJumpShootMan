extends Control
var MaskState := 1
var PosCurrentMask = Vector2(955,0)
var SizeCurrentMask = Vector2(100,100)
var PosPreviousMask = Vector2(885,30)
var SizePreviousMask = Vector2(70,70)
var PosNextMask = Vector2(1055,30)
var SizeNextMask = Vector2(70,70)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		if Input.is_action_just_pressed("SwapMaskForward"):
			print ("movemask")
			MaskState += 1
			if MaskState >=3: MaskState = 0
			print(MaskState)
			if MaskState == 0:
				$MaskSwapRedmask.position = PosCurrentMask
				$MaskSwapRedmask.size = SizeCurrentMask
				$MaskSwapBluemask.position = PosPreviousMask
				$MaskSwapBluemask.size = SizePreviousMask
				$MaskSwapGreenmask.position = PosNextMask
				$MaskSwapGreenmask.size = SizeNextMask
			if MaskState == 1:
				$MaskSwapGreenmask.position = PosCurrentMask
				$MaskSwapGreenmask.size = SizeCurrentMask
				$MaskSwapRedmask.position = PosPreviousMask
				$MaskSwapRedmask.size = SizePreviousMask
				$MaskSwapBluemask.position = PosNextMask
				$MaskSwapBluemask.size = SizeNextMask
			if MaskState == 2:
				$MaskSwapBluemask.position = PosCurrentMask
				$MaskSwapBluemask.size = SizeCurrentMask
				$MaskSwapGreenmask.position = PosPreviousMask
				$MaskSwapGreenmask.size = SizePreviousMask
				$MaskSwapRedmask.position = PosNextMask
				$MaskSwapRedmask.size = SizeNextMask
