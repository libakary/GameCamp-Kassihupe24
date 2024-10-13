extends Node2D

@onready var guitarkey_scene = preload("res://Scenes/GuitarKey.tscn")
@onready var guitarkey_kill = preload("res://Scenes/guitar_pressed.tscn")

@onready var guitarkey_positions = $Spawnpoints

var points_total = 20
var points_lost = 0
var points_gained = 0
var points = points_total - points_lost

func _on_guitar_timer_timeout() -> void:
	var guitarkey_positions_array = guitarkey_positions.get_children()
	var random_guitarkey_position = guitarkey_positions_array.pick_random()
	
	var guitarkey = guitarkey_scene.instantiate()
	guitarkey.global_position = random_guitarkey_position.global_position
	add_child(guitarkey)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_left"):
		var guitarkill = guitarkey_kill.instantiate()
		guitarkill.position = Vector2(-62, 135)
		add_child(guitarkill)
	if Input.is_action_just_pressed("ui_right"):
		var guitarkill = guitarkey_kill.instantiate()
		guitarkill.position = Vector2(53, 135)
		add_child(guitarkill)
	if Input.is_action_just_pressed("ui_down"):
		var guitarkill = guitarkey_kill.instantiate()
		guitarkill.position = Vector2(14, 135)
		add_child(guitarkill)
	if Input.is_action_just_pressed("ui_up"):
		var guitarkill = guitarkey_kill.instantiate()
		guitarkill.position = Vector2(-25, 135)
		add_child(guitarkill)


#func _on_death_box_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	#print("u missed")
	#points_lost += 1
	#points_gained += 1
	#print (points_lost)
	#if points_gained == 20:
		#var points_left = Points_total - points_lost
		#print (points_left)
		#queue_free()
#
#func _on_guitar_key_0_key_killed() -> void:
	#GainPoint()

func _on_death_box_area_entered(area: Area2D) -> void:
	print("U missed")
	points_lost += 1
	points_total - points_lost
	#print(points_lost)
	#print(points_total - points_lost)

func _ready():
	print(points_total - points_lost)

var timerIn
var timeCost = 8

var sanityBarIn
var sanityTimerIn
var sanityTimer
var sanityMod = -5

func _on_termination_timeout() -> void:
	_ready()
	get_node("../MainGameWindow/Mastermind").inTask = false
	
	
	queue_free()
