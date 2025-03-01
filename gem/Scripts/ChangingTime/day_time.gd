extends Timer

var mastermind
var gameHolder

var healthBar
var healthBarParent
var sanityBar
var sanityBarParent

var hourClock
var minuteClock
var dayClock
var lastTime = 60
var newTime = 60

var nightFade
var fadeStage = 0 #0 = No fade; 1 = Fade to black; 2 = Fade to colour

var minuteValue = 0
var hourValue = 8

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hourClock = get_node("../../../../UserInterface/ClockDisplayHours")
	minuteClock = get_node("../../../../UserInterface/ClockDisplayMinutes")
	dayClock = get_node("../../../../UserInterface/DayDisplay")
	nightFade = get_node("../nightFadeBG")
	mastermind = get_node("../../../../Mastermind")
	gameHolder = get_node("../../../../../../GameHolder")
	
	healthBar = get_node("../../../../Control/WorkBars/HealthBar/TimerHealth")
	healthBarParent = get_node("../../../../Control/WorkBars/HealthBar")
	sanityBar = get_node("../../../../Control/WorkBars/SanityBar/TimerSanity")
	sanityBarParent = get_node("../../../../Control/WorkBars/SanityBar")
	
	wait_time = 60
	start()


func fadeToMorning() -> void:
	fadeStage = 1 #Start fading to black
	gameHolder.currentDay += 1 #Change the Day
	mastermind.inTask = true #Locks moving during moving
	paused = true #Pauses the clock
	
	#Stop the bars during night time
	healthBar.paused = true 
	sanityBar.paused = true
	
	healthBarParent.dayNumber = gameHolder.currentDay #Updates the day count in the timer
	healthBarParent.resetWaitTime() #Restarts the timer from the appropriate value
	sanityBarParent.dayNumber = gameHolder.currentDay #Updates the day count in the timer
	sanityBarParent.resetWaitTime() #Restarts the timer from the appropriate value
	#Clock is reset in _process

func setDay(dayNumber: int) -> String:
	var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
	return days[dayNumber]
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	newTime = roundf(time_left)
	hourClock.text = (str(hourValue))
	if (minuteValue == 0):
		minuteClock.text = ("00")
	else:
		minuteClock.text = (str(minuteValue))
	
	if (lastTime-newTime > 0):
		minuteValue += 15
	if (minuteValue == 60):
		minuteValue = 0
		hourValue += 1
	if (hourValue >= 23 && fadeStage == 0):	
		fadeToMorning()
	
	lastTime = roundf(time_left)
	
	#Handles fading to black during day switch
	if nightFade.modulate.a >= 1.75 && fadeStage == 1: #Start fading to colour
		fadeStage = 2
		#Reset the clock after day start
		minuteValue = 0
		hourValue = 8
		dayClock.text = setDay(gameHolder.currentDay)
		
	if nightFade.modulate.a <= 0 && fadeStage == 2: #Stop fading to colour
		fadeStage = 0
		mastermind.inTask = false #Unlocks movement
		paused = false #Starts the clock
		#Resume the bars after the night
		healthBar.paused = false 
		sanityBar.paused = false
	var fadeSpeed = 0.0005
	if fadeStage == 1: #Fade to black
		nightFade.modulate.a += fadeSpeed
	if fadeStage == 2: #Fade to colour
		nightFade.modulate.a -= fadeSpeed
	
