extends Area2D

var KeySpeed = float(200)

signal KeyKilled

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	$Sprite2D.z_index = 100
	position.y += KeySpeed * delta


func _on_area_entered(_area: Area2D) -> void:
	emit_signal("KeyKilled")
	queue_free()
	
