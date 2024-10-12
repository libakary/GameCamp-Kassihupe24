extends CharacterBody2D

var launched: bool = false
var is_mouse_over = false
var is_button_held = false

func _ready() -> void:
	set_process_input(true)  # Enable input processing
	
func _process(delta: float) -> void:
	if is_button_held:
		print("Mouse is held over the sprite!")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	velocity += get_gravity() * delta
	
	if (launched): move_and_slide()

func _input(event):
	# Check if the mouse is over the sprite
	if event is InputEventMouseMotion:
		is_mouse_over = true
	elif event is InputEventMouseButton and event.button_index == 1:
		if is_mouse_over:
			is_button_held = true
	else:
		is_button_held = false

	# Reset the mouse-over flag when the mouse leaves the sprite area
	if event is InputEventMouseMotion:
		if !is_mouse_over_area(event.position):
			is_mouse_over = false

func is_mouse_over_area(mouse_position):
	var global_position = get_global_position()
	var texture_size = $Sprite2D.texture.get_size() * scale  # Get the scaled texture size
	var rect = Rect2(global_position, texture_size)  # Create a rectangle based on position and size
	return rect.has_point(mouse_position)


#extends CharacterBody2D
#
#
#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
#
#
#func _physics_process(delta: float) -> void:
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#
