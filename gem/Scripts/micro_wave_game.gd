extends Node2D

@onready var timer1 = get_node("Buttontimer1")
var points = 0
@onready var microbutton = $"Microwave button2/MicroButton"

func _ready():
	microbutton = false

func _on_microwave_button_mouse_entered() -> void:
	print ("mouse in")
	$Buttontimer1.start()

func _on_buttontimer_1_timeout() -> void:
	points += 1
	print (points)
	if points == 12:
		print("now to start the thing..")
		$"Microwave button2/MicroButton".enabled = true
