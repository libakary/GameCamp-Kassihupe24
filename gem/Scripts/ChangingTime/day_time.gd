extends Timer

var hourClock
var minuteClock
var lastTime = 60
var newTime = 60

var nightFade

var minuteValue = 0
var hourValue = 8

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hourClock = get_node("../../../../UserInterface/ClockDisplayHours")
	minuteClock = get_node("../../../../UserInterface/ClockDisplayMinutes")
	nightFade = get_node("../nightFadeBG")
		
	wait_time = 60
	start()


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
	if (hourValue >= 23):	
		nightFade.modulate.a += 0.001
		minuteValue = 0
	if (nightFade.modulate.a >= 1):
		pass
	
	
	lastTime = roundf(time_left)
