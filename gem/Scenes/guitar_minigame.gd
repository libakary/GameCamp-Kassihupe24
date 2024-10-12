extends Node2D

@onready var guitarkey_scene = preload("res://Scenes/GuitarKey.tscn")
@onready var guitarkey_kill = preload("res://Scenes/guitar_pressed.tscn")
@onready var guitarkey_positions = $Spawnpoints

func _on_guitar_timer_timeout() -> void:
	var guitarkey_positions_array = guitarkey_positions.get_children()
	var random_guitarkey_position = guitarkey_positions_array.pick_random()
	
	var guitarkey = guitarkey_scene.instantiate()
	guitarkey.global_position = random_guitarkey_position.global_position
	add_child(guitarkey)


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_left"):
		var guitarkill = guitarkey_kill.instantiate()
		guitarkill.position = Vector2(277, 289)
		add_child(guitarkill)
	if Input.is_action_just_pressed("ui_right"):
		var guitarkill = guitarkey_kill.instantiate()
		guitarkill.position = Vector2(389, 289)
		add_child(guitarkill)
	if Input.is_action_just_pressed("ui_down"):
		var guitarkill = guitarkey_kill.instantiate()
		guitarkill.position = Vector2(357, 289)
		add_child(guitarkill)
	if Input.is_action_just_pressed("ui_up"):
		var guitarkill = guitarkey_kill.instantiate()
		guitarkill.position = Vector2(314, 289)
		add_child(guitarkill)
