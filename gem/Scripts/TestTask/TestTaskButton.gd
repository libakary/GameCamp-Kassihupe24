extends Sprite2D

#Check if the button was pressed
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		if get_rect().has_point(to_local(event.position)):
			get_node("../../MainGameWindow/Mastermind").inTask = false
			get_node("../").queue_free()

func _process(_delta: float) -> void:
	print(get_node("../../MainGameWindow/Mastermind"))
