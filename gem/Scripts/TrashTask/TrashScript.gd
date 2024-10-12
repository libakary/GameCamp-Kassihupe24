extends CharacterBody2D

var launched: bool = false
var launchStarted: bool = false
var launchStrength = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	velocity += get_gravity() * delta
	
	if (launched): move_and_slide()

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		if $Sprite2D.get_rect().has_point(to_local(event.position)):
			if !launchStarted:
				launchStarted = true
			else:
				launched = true
				velocity = Vector2(launchStrength, -launchStrength)
			
func _process(delta: float) -> void:
	launchStrength += 4
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
