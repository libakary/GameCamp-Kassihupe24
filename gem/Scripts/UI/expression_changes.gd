extends Node2D

var sanityBarIn
var sanityTimerIn
var sanityTimer
var sanityMod = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	sanityTimerIn = get_node("../Control/WorkBars/SanityBar/TimerSanity") 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float):
	
	if (sanityTimerIn.time_left > 40):
		$AnimatedSprite2D.play("good")
	if (sanityTimerIn.time_left < 35):
		$AnimatedSprite2D.play("neutral")
	if (sanityTimerIn.time_left < 25):
		$AnimatedSprite2D.play("sad")
	if (sanityTimerIn.time_left < 15):
		$AnimatedSprite2D.play("panic")
	if (sanityTimerIn.time_left < 5):
		$AnimatedSprite2D.play("manic")
		

			
