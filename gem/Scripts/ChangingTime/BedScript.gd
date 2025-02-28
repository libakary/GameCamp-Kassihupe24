extends Area2D

var inInteractionRange: bool = false
var earliestSleepTime = 8
var GameHolder #Gameholder node
var DayTimer #DayTimer node

func _ready() -> void:
	GameHolder = get_node("../../../../../../../../GameHolder")
	DayTimer = get_node("../../../DayTimer")

func resetDay() -> void:
	GameHolder.currentDay += 1 #Change the Day
	DayTimer.fadeToMorning()

func _on_body_entered(body: Node2D) -> void:
	if (body == get_node("../../../Player")):
		
		#Allow for interaction
		inInteractionRange = true

func _on_body_exited(body: Node2D) -> void:
	if (body == get_node("../../../Player")):
		
		#Not allow for interaction
		inInteractionRange = false
		
func _process(_delta: float) -> void: #What happens when slept
	#Check for interaction
	if (Input.is_action_just_pressed("interact") and inInteractionRange and get_node("../../../DayTimer").hourValue >= earliestSleepTime):
		resetDay()
