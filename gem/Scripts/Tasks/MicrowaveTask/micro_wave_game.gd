extends Node2D

@onready var timer1 = get_node("Buttontimer1")
var points = 0
@onready var microbutton = $"Microwave button2/MicroButton"
@onready var mouseFollowerRect = $TextureRect2 

var timerIn
var timeCost: int = 0

var healthBarIn
var healthTimerIn
var healthTimer
var healthMod = 20

func _ready():
	microbutton = false
	process_mode = Node.PROCESS_MODE_PAUSABLE
	
	timerIn = get_node("../MainGameWindow/SubViewportContainer/SubViewport/RoomMovement/DayTimer")
	
	healthBarIn = get_node("../MainGameWindow/Control/WorkBars/HealthBar/HBar")
	healthTimerIn = get_node("../MainGameWindow/Control/WorkBars/HealthBar/TimerHealth") 

func _on_microwave_button_mouse_entered() -> void:
	#print ("mouse in")
	$Buttontimer1.start()

func _on_buttontimer_1_timeout() -> void:
	points += 1
	if points == 30:
		points = points
	#print (points)
	$SFXKey1.play()


func _on_termination_timer_timeout() -> void:
	$SFXDing.play()
	print("now to start the thing..")
	
	
	var timespent : float
	if points != 0:
		timespent = 10 * ((2/(points/10)) +1)
	else:
		timespent = 40
	
	print (timespent)
	
	timeCost = timespent*2/5
	
	healthTimer = healthTimerIn.time_left + healthMod
	if (healthTimer > healthBarIn.max_value):
		healthTimer = healthBarIn.max_value
	healthTimerIn.start(healthTimer)
	
	#Skip Time
	print(timeCost)
	var minutes = timeCost % 4
	var hours = roundf(timeCost/4)
	
	timerIn.minuteValue += minutes*15
	timerIn.hourValue += hours
	
	get_node("../MainGameWindow/Mastermind").inTask = false
	queue_free()
