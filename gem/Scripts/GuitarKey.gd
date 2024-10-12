extends Area2D

var KeySpeed = float(2)

func _process(delta: float) -> void:
	position.y += KeySpeed


func _on_area_entered(area: Area2D) -> void:
	queue_free()
