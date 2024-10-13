extends Node2D

var inTask: bool = false

func _process(delta: float) -> void:
	if (get_node("../Control/WorkBars/SanityBar/SBar").value <= 0):
		get_tree().change_scene_to_file("res://Scenes/Endings/BadEnd.tscn")

func _on_audio_stream_player_2d_finished() -> void:
	pass # Replace with function body.
