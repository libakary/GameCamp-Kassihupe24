extends Sprite2D

var nightBGSprite
var dayGuitar
var nightGuitar
var fadeSpeed: float = 0.0001

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Get refrences
	nightBGSprite = get_node("../BGnight")
	dayGuitar = $FurnitureOverlays/GuitarDay
	nightGuitar = $FurnitureOverlays/GuitarNight

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#Fade BG
	#modulate.a -= fadeSpeed
	nightBGSprite.modulate.a += fadeSpeed
	
	#Fade Guitar
	#dayGuitar.modulate.a -= fadeSpeed
	nightGuitar.modulate.a += fadeSpeed
