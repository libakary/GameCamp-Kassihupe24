extends Timer

var hourClock
var minuteClock
var lastTime = 60
var newTime = 60

var minuteValue = 0
var hourValue = 8

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hourClock = get_node("../../../../UserInterface/ClockDisplayHours")
	minuteClock = get_node("../../../../UserInterface/ClockDisplayMinutes")
	
		
	wait_time = 60
	start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
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
	
	lastTime = roundf(time_left)
