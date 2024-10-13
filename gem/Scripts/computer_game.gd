extends Node2D

var points = 0
var buttoncadence = 0.2
var buttoncooldown = 0.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("LeftClick") and $ButtonCooldown.time_left <= 0:
		points += 1
		print (points)
		$ButtonCooldown.wait_time = 0.5
		$ButtonCooldown.start()
		
		#await get_tree().create_timer(0.5).timeout
	

func _ready():
	pass


func _on_termination_timeout() -> void:
	var timespent : float
	timespent = 10 * ((2 / (points/ 5)) +1)
	print (timespent)
	queue_free()


func _on_area_2d_2_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("RightClick") and $ButtonCooldown.time_left <= 0:
		points += 1
		print (points)
		$ButtonCooldown.wait_time = 0.5
		$ButtonCooldown.start()
		
		#await get_tree().create_timer(0.5).timeout
