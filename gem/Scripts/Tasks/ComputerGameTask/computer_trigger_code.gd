extends Area2D

var inInteractionRange: bool = false

func _on_body_entered(body: Node2D) -> void:
	if (body == get_node("../../../Player")):
		
		#Change trigger area
		
		#Allow for interaction
		inInteractionRange = true


func _on_body_exited(body: Node2D) -> void:
	if (body == get_node("../../../Player")):
		
		#Change trigger area
		
		#Not allow for interaction
		inInteractionRange = false
		
func _process(_delta: float) -> void:
	#Check for interaction
	if (Input.is_action_just_pressed("interact") and inInteractionRange):
		
		var loadedGamePacked = load("res://Scenes/Tasks/Computer/computer_game.tscn")
		var loadedGame = loadedGamePacked.instantiate()
		loadedGame.position = Vector2(0, 0)
		get_node("../../../../../../../").add_child(loadedGame)
		
		get_node("../../../../../../Mastermind").inTask = true
