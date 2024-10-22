extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



func _on_decay_timer_timeout() -> void:
	queue_free()
