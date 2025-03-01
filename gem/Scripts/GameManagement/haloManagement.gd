extends Node2D

var HaloTimer

var filledHalos
var BedFilled
var MikroFilled
var GuitarFilled
var ComputerFilled
var TrashFilled

var blinkingSpeed = 1 #In seconds how long it takes to switch between on and off
var fullHalosOn = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	HaloTimer = $HaloTimer
	
	filledHalos = [$BedHaloFilled, $MikroHaloFilled, $GuitarHaloFilled, $ComputerHaloFilled, $TrashHaloFilled]
	HaloTimer.wait_time = blinkingSpeed
	HaloTimer.start()

func manageHalos():
	if !fullHalosOn:
		for i in filledHalos.size():
			filledHalos[i].visible = true
			fullHalosOn = true
	else:
		for i in filledHalos.size():
			filledHalos[i].visible = false
			fullHalosOn = false
	HaloTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if HaloTimer.time_left <= 0.1:
		manageHalos()
