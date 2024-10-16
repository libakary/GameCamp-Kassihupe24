extends Area2D

var KeySpeed = float(200)
signal KeyKilled

func _process(delta: float) -> void:
	position.y += KeySpeed * delta

func _on_area_entered(area: Area2D) -> void:
	queue_free()
	emit_signal("KeyKilled")
