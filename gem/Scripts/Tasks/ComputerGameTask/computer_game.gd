extends Node2D

var points = 0
var buttoncadence = 0.2
var buttoncooldown = 0.0
var lastButtonPressed

var timerIn
var timeCost = 0

var workBar

var sanityBarIn
var sanityTimerIn
var sanityTimer
var sanityMod = -10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if lastButtonPressed == "left":
		$RightButton.scale = Vector2(1.5, 1.5)
		$LeftButton.scale = Vector2.ONE
	else:
		$LeftButton.scale = Vector2(1.5, 1.5)
		$RightButton.scale = Vector2.ONE


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("LeftClick") and lastButtonPressed != "left":
		points += 1
		#print (points)
		lastButtonPressed = "left"
		#$LeftButton/Area2D/CollisionShape2D/SFXKey1.play()
		#await get_tree().create_timer(0.5).timeout
	

func _ready():
	timerIn = get_node("../MainGameWindow/SubViewportContainer/SubViewport/RoomMovement/DayTimer")
	
	workBar = get_node("../MainGameWindow/Control/WorkBars/WorkBar/WBar")
	
	sanityTimerIn = get_node("../MainGameWindow/Control/WorkBars/SanityBar/TimerSanity")
	sanityBarIn = get_node("../MainGameWindow/Control/WorkBars/SanityBar/SBar")
	
func _on_termination_timeout() -> void:
	var timespent : float
	if points != 0: timespent = 10 * ((2 / (points/ 5)) +1)
	print (timespent)
	
	#Skip Time
	var minutes = timeCost % 4
	var hours = roundf(timeCost/4)
	
	timerIn.minuteValue += minutes*15
	timerIn.hourValue += hours
	
	#Add to sanity
	sanityTimer = sanityTimerIn.time_left + sanityMod
	if (sanityTimer > sanityBarIn.max_value):
		sanityTimer = sanityBarIn.max_value
	sanityTimerIn.start(sanityTimer)
	
	workBar.value += points*5
	
	get_node("../MainGameWindow/Mastermind").inTask = false
	queue_free()


func _on_area_2d_2_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("RightClick") and lastButtonPressed != "right":
		points += 1
		#print (points)
		lastButtonPressed = "right"
		#$RightButton/Area2D2/CollisionShape2D/SFXKey2.play()
		#await get_tree().create_timer(0.5).timeout
