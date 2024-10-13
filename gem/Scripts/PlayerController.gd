extends CharacterBody2D

#@export var sfx_footsteps : AudioStream
#var footstep_frames : Array = [0, 1]
var healthBar
var maxSpeed: int = 200 #w/o modifier
var speed: int = 300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	healthBar = get_node("../../../../Control/WorkBars/HealthBar/HBar")

#func load_sfx(sfx_to_load):
	#if %SFXPlayer.stream != sfx_to_load:
		#%SFXPlayer.stop()
		#%SFXPlayer.stream = sfx_to_load
#
#func _on_sprite_frame_changed():
	#if %Player.animation == "idle": return
	#load_sfx(sfx_footsteps)
	#if %Sprite.frame in footstep_frames: %SFXPlayer.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	speed = 100+healthBar.value*2/100*maxSpeed
	var input_direction = Vector2.ZERO
	input_direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	if input_direction:
		velocity = input_direction * speed
		#play walk animation + flip them based on direction
		if velocity != Vector2.ZERO:
			$AnimatedSprite2D.play("walk")
			#$SFXPlayer.play()
			$AnimatedSprite2D.flip_v = false
			# See the note below about boolean assignment.
			$AnimatedSprite2D.flip_h = velocity < Vector2.ZERO
			
	else:
		#velocity.x = move_toward(velocity.x, 0, speed)
		#velocity.y = move_toward(velocity.y, 0, speed)
		#movement stops and character stands... not too elegant but
		$AnimatedSprite2D.play("idle")	
	
	# Normalize the direction so that diagonal movement isn't faster
	if input_direction != Vector2.ZERO:
		input_direction = input_direction.normalized()

	# Set the velocity based on input and speed
	velocity = input_direction * speed
	
	# Use move_and_slide() in CharacterBody2D
	if (!get_node("../../../../Mastermind").inTask):
		move_and_slide()
		
	#var direction = Input.get_axis("ui_left", "ui_right")
	
