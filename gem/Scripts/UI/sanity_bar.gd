extends Node2D

@onready var timer = get_node("TimerSanity")
@onready var progressBar = get_node("SBar")
# Called when the node enters the scene tree for the first time.
var sanityDecreaseValues = [2, 1.7, 1.4, 1.1, 0.8, 0.5] #How many second per tick down. Sunday is first value, monday next, etc
var dayNumber

func resetWaitTime():
	timer.wait_time = progressBar.value*sanityDecreaseValues[dayNumber] #Set the appropriate time for the daily multiplier
	timer.start() #Starts the timer

func _ready():
	dayNumber = get_node("../../../../../GameHolder").currentDay #Set the first day number
	resetWaitTime() #Start the timer

func _process(_delta):
	progressBar.value = timer.time_left/sanityDecreaseValues[dayNumber] #Update the progress bar to match the timer


func _on_timer_sanity_timeout():
	print("Sanity 0")
