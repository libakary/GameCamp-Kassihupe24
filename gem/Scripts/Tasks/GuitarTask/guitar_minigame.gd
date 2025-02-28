extends Node2D

@onready var guitarkey_scene = load("res://Scenes/Tasks/Guitar/guitar_key.tscn")
@onready var guitarkey_kill = load("res://Scenes/Tasks/Guitar/guitar_pressed.tscn")

@onready var guitarkey_positions = $Spawnpoints

var points_total = 16
var points_lost = 0
var points_gained = 0
var points = points_total - points_lost

func _on_guitar_timer_timeout() -> void:
	var guitarkey_positions_array = guitarkey_positions.get_children()
	var random_guitarkey_position = guitarkey_positions_array.pick_random()
	
	var guitarkey = guitarkey_scene.instantiate()
	guitarkey.global_position = random_guitarkey_position.global_position
	add_child(guitarkey)

func _process(_delta: float) -> void:
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

func _on_death_box_area_entered(_area: Area2D) -> void:

	points_lost += 1

func _ready():
	#get_tree().quit()
	pass

var timerIn
var timeCost = 0

var sanityBarIn
var sanityTimerIn
var sanityTimer
var sanityMod


func _on_termination_timeout() -> void:
	_ready()
	get_node("../MainGameWindow/Mastermind").inTask = false
	
	timerIn = get_node("../MainGameWindow/SubViewportContainer/SubViewport/RoomMovement/DayTimer")
	
	sanityBarIn = get_node("../MainGameWindow/Control/WorkBars/SanityBar/SBar")
	sanityTimerIn = get_node("../MainGameWindow/Control/WorkBars/SanityBar/TimerSanity")
	sanityMod = points_total-points_lost*1.5
	sanityTimer = sanityTimerIn.time_left + sanityMod
	if (sanityTimer > sanityBarIn.max_value):
		sanityTimer = sanityBarIn.max_value
	sanityTimerIn.start(sanityTimer)
	
	var minutes = timeCost % 4
	var hours = roundf(timeCost/4)
	
	timerIn.minuteValue += minutes*15
	timerIn.hourValue += hours
	
	queue_free()
