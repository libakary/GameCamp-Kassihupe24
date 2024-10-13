extends Node2D

var points = 0
var buttoncadence = 0.2
var buttoncooldown = 0.0
var lastButtonPressed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if lastButtonPressed == "left":
		$RightButton.scale = Vector2(1.5, 1.5)
		$LeftButton.scale = Vector2.ONE
	else:
		$LeftButton.scale = Vector2(1.5, 1.5)
		$RightButton.scale = Vector2.ONE


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("LeftClick") and lastButtonPressed != "left":
		points += 1
		print (points)
		lastButtonPressed = "left"
		$LeftButton/Area2D/CollisionShape2D/SFXKey1.play()
		#await get_tree().create_timer(0.5).timeout
	

func _ready():
	pass


func _on_termination_timeout() -> void:
	var timespent : float
	timespent = 10 * ((2 / (points/ 5)) +1)
	print (timespent)
	
	get_node("../MainGameWindow/Mastermind").inTask = false
	queue_free()


func _on_area_2d_2_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("RightClick") and lastButtonPressed != "right":
		points += 1
		print (points)
		lastButtonPressed = "right"
		$RightButton/Area2D2/CollisionShape2D/SFXKey2.play()
		#await get_tree().create_timer(0.5).timeout
