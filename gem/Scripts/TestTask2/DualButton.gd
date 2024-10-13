#extends Sprite2D
#
#var active = false
#
##Check if the button was pressed
#func _input(event):
	#if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		#if get_rect().has_point(to_local(event.position)):
			#if (!active):
				#get_node("../TaskManager").buttonCount += 1
				#active = true
