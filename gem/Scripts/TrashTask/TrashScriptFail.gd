extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body == %Ball:
		get_node("../../../MainGameWindow/Mastermind").inTask = false
		get_node("../../").queue_free()
