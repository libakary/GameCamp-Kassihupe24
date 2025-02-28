extends Sprite2D

var triggered = false

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		if get_rect().has_point(to_local(event.position)) && triggered == false:
			triggered = true
			get_node("../GameHolder").add_child(load("res://Scenes/GameManagement/main_game_window.tscn").instantiate())
			
			#Hide the screen
			get_node("../MenuBg").hide()
			get_node("../StartButt").hide()
			get_node("../QuitButt").hide()
