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
	var BGfadeValue = (Daytimer.hourValue - 7)/16
	
	#Fade BG
	nightBGSprite.modulate.a = BGfadeValue
	#Fade Guitar
	nightGuitar.modulate.a = BGfadeValue
