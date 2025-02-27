extends Sprite2D

var nightBGSprite
var dayGuitar
var nightGuitar
var fadeSpeed: float = 0.00003
var Daytimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Get refrences
	Daytimer = get_node("../DayTimer")
	nightBGSprite = get_node("../BGnight")
	dayGuitar = $FurnitureOverlays/GuitarDay
	nightGuitar = $FurnitureOverlays/GuitarNight

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#Fade BG
	#modulate.a -= fadeSpeed
	nightBGSprite.modulate.a += fadeSpeed#1/(16-(Daytimer.hourValue-8))
	print(nightBGSprite.modulate)
	
	#Fade Guitar
	#dayGuitar.modulate.a -= fadeSpeed
	nightGuitar.modulate.a += fadeSpeed#1/(16-(Daytimer.hourValue-8))
