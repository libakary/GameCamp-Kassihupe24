extends Area2D

var timerIn
var timeCost = 0

var sanityBarIn
var sanityTimerIn
var sanityTimer
var sanityMod = 10

var healthBarIn
var healthTimerIn
var healthTimer
var healthMod = 10

func _ready() -> void:
	timerIn = get_node("../../../MainGameWindow/SubViewportContainer/SubViewport/RoomMovement/DayTimer")
	
	healthBarIn = get_node("../../../MainGameWindow/Control/WorkBars/HealthBar/HBar")
	sanityBarIn = get_node("../../../MainGameWindow/Control/WorkBars/SanityBar/SBar")
	
	healthTimerIn = get_node("../../../MainGameWindow/Control/WorkBars/HealthBar/TimerHealth")
	sanityTimerIn = get_node("../../../MainGameWindow/Control/WorkBars/SanityBar/TimerSanity")

func _on_body_entered(body: Node2D) -> void:
	if body == %Ball:
		#$CollisionPolygon2D/TrashCrash.play()
		#Add to health
		healthTimer = healthTimerIn.time_left + healthMod
		if (healthTimer > healthBarIn.max_value):
			healthTimer = healthBarIn.max_value
		healthTimerIn.start(healthTimer)
		
		#Add to sanity
		sanityTimer = sanityTimerIn.time_left + sanityMod
		if (sanityTimer > sanityBarIn.max_value):
			sanityTimer = sanityBarIn.max_value
		sanityTimerIn.start(sanityTimer)
		
		#Skip Time
		var minutes = timeCost % 4
		var hours = roundf(timeCost/4)
		
		timerIn.minuteValue += minutes*15
		timerIn.hourValue += hours
		
		get_node("../../../MainGameWindow/Mastermind").inTask = false
		get_node("../../").queue_free()


func _on_trash_crash_finished() -> void:
	pass # Replace with function body.
