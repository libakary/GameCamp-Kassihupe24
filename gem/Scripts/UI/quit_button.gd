extends Sprite2D

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		if get_rect().has_point(to_local(event.position)):
			get_tree().quit()
