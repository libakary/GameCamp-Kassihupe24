extends Node2D

@onready var timer1 = get_node("Buttontimer1")
var points = 0
@onready var microbutton = $"Microwave button2/MicroButton"
@onready var mouseFollowerRect = $TextureRect2 

func _ready():
	microbutton = false
	process_mode = Node.PROCESS_MODE_PAUSABLE

func _on_microwave_button_mouse_entered() -> void:
	print ("mouse in")
	$Buttontimer1.start()

func _on_buttontimer_1_timeout() -> void:
	points += 1
	if points == 30:
		points = points
	print (points)
	


func _on_termination_timer_timeout() -> void:
	print("now to start the thing..")
	
	await get_tree().create_timer(3).timeout
	get_tree().paused = true
	var timespent : float
	timespent = 10 * ((2 / (points/ 10)) +1)
	print (timespent)
	queue_free()
