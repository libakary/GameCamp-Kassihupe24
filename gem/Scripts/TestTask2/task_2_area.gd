extends Area2D

var inInteractionRange: bool = false

func _on_body_entered(body: Node2D) -> void:
	if (body == get_node("../../../Player")):
		
		#Change trigger area
		var triggerSprite = get_node("../AreaSprite")
		var Highlight = load("res://Sprites/AreaHighlight.png")
		triggerSprite.texture = Highlight
		
		#Allow for interaction
		inInteractionRange = true


func _on_body_exited(body: Node2D) -> void:
	if (body == get_node("../../../Player")):
		
		#Change trigger area
		var triggerSprite = get_node("../AreaSprite")
		var RegSpirte = load("res://Sprites/AreaTrigger.png")
		triggerSprite.texture = RegSpirte
		
		#Not allow for interaction
		inInteractionRange = false
		
func _process(_delta: float) -> void:
	
	#Check for interaction
	if (Input.is_action_just_pressed("interact") and inInteractionRange):
		var loadedGamePacked = load("res://Scenes/Tasks/minigame_test2.tscn")
		var loadedGame = loadedGamePacked.instantiate()
		loadedGame.position = Vector2(427, 240)
		get_node("../../../../").add_child(loadedGame)
