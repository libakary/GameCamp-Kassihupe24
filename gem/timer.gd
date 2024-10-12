extends Node2D

@onready var timer = get_node("Timer")
@onready var progressBar = get_node("TextureProgressBar")
# Called when the node enters the scene tree for the first time.

func _ready():
	timer.wait_time = progressBar.value
	$Timer.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(timer.time_left)
	progressBar.value = timer.time_left

#siia tuleks siis if timer on 30 then all kinds of shit h

#iga node eraldi kutsuda ja kirjutada mis sellega juhtub

func _on_timer_timeout():
	print("Health 0")
