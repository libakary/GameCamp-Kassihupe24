extends Area2D

var sanityTimerIn
var sanityBarIn
var sanityTimer
var sanityMod = 20

var healthBarIn
var healthTimerIn
var healthTimer
var healthMod = 20

func _ready() -> void:
	healthBarIn = get_node("../../../MainGameWindow/Control/WorkBars/HealthBar/HBar")
	sanityBarIn = get_node("../../../MainGameWindow/Control/WorkBars/SanityBar/SBar")
	
	healthTimerIn = get_node("../../../MainGameWindow/Control/WorkBars/HealthBar/TimerHealth") 
	sanityTimerIn = get_node("../../../MainGameWindow/Control/WorkBars/SanityBar/TimerSanity") 

func _on_body_entered(body: Node2D) -> void:
	if body == %Ball:
		#print(get_node("../../../MainGameWindow/Control/WorkBars/HealthBar/HBar").value)
		#get_node("../../../MainGameWindow/Control/WorkBars/WorkBar/WBar").value += 20
		#print(get_node("../../../MainGameWindow/Control/WorkBars/HealthBar/HBar").value)
		
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
		
		get_node("../../../MainGameWindow/Mastermind").inTask = false
		get_node("../../").queue_free()
