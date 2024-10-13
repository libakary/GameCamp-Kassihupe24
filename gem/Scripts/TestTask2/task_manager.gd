#extends Node2D
#
#var buttonCount: int = 0
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta: float) -> void:
	#if (buttonCount >= 2):
		#get_node("../../MainGameWindow/Mastermind").inTask = false
		#get_parent().queue_free()
