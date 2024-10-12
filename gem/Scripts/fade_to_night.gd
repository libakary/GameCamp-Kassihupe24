extends Sprite2D

var nightSprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	nightSprite = get_node("../BGnight")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	modulate.a -= 0.001
	nightSprite.modulate.a += 0.001
