extends Timer

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
		
	wait_time = 60
	start()


func fadeToMorning() -> void:
	fadeStage = 1 #Start fading to black
	#Clock is reset in _process

func setDay(dayNumber: int) -> String:
	if dayNumber == 1: return "Monday"
	elif dayNumber == 2: return "Tuesday"
	elif dayNumber == 3: return "WedensDay"
	elif dayNumber == 4: return "Thursday"
	elif dayNumber == 5: return "Friday"
	elif dayNumber == 6: return "Saturday"
	else: return "Sunday"
	
	
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
	if nightFade.modulate.a >= 1.5 && fadeStage == 1: #Start fading to colour
		fadeStage = 2
		#Reset the clock after day start
		minuteValue = 0
		hourValue = 8
		dayClock.text = setDay(get_node("../../../../../../GameHolder").currentDay)
		
	if nightFade.modulate.a <= 0 && fadeStage == 2: #Stop fading to colour
		fadeStage = 0
	
	if fadeStage == 1: #Fade to black
		nightFade.modulate.a += 0.001
	if fadeStage == 2: #Fade to colour
		nightFade.modulate.a -= 0.001
	
