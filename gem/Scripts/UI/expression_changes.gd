extends Node2D

var sanityBar
var sanityBarValue

# Called when the node enters the scene tree for the first time.
func _ready():
	sanityBar = get_node("../Control/WorkBars/SanityBar/SBar")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float):
	if (sanityBarValue == 35): print(sanityBarValue)
	sanityBarValue = sanityBar.value
	if (sanityBarValue > 40):
		$AnimatedSprite2D.play("good")
	if (sanityBarValue < 35):
		$AnimatedSprite2D.play("neutral")
	if (sanityBarValue < 25):
		$AnimatedSprite2D.play("sad")
	if (sanityBarValue < 15):
		$AnimatedSprite2D.play("panic")
	if (sanityBarValue < 5):
		$AnimatedSprite2D.play("manic")
		

			
