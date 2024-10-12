extends CharacterBody2D

var speed: int = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var input_direction = Vector2.ZERO
	input_direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	# Normalize the direction so that diagonal movement isn't faster
	if input_direction != Vector2.ZERO:
		input_direction = input_direction.normalized()

	# Set the velocity based on input and speed
	velocity = input_direction * speed
	
	# Use move_and_slide() in CharacterBody2D
	move_and_slide()
