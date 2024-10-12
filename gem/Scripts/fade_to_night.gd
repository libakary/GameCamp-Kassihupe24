extends Sprite2D

var nightSprite
var fadeSpeed: float = 0.001

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	nightSprite = get_node("../BGnight")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	modulate.a -= fadeSpeed
	nightSprite.modulate.a += fadeSpeed
