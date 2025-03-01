extends Node2D

@onready var timer = get_node("TimerHealth")
@onready var progressBar = get_node("HBar")
# Called when the node enters the scene tree for the first time.
var healthDecreaseValues = [2.2, 1.9, 1.6, 1.3, 1, 0.7, 0.4] #How many second per tick down. Sunday is first value, monday next, etc
var dayNumber

#ElMo
func resetWaitTime():
	timer.wait_time = progressBar.value*healthDecreaseValues[dayNumber] #Set the appropriate time for the daily multiplier
	timer.start() #Starts the timer

func _ready():
	#The rest of the timer config takes place in fadeToMorning in day_time.gd
	dayNumber = get_node("../../../../../GameHolder").currentDay #Set the first day number
	resetWaitTime() #Start the timer
	
func _process(_delta):
	progressBar.value = timer.time_left/healthDecreaseValues[dayNumber] #Update the progress bar to match the timer


func _on_timer_health_timeout():
	print("Health 0")
