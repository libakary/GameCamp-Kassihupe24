extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if (body == get_node("../../../Player")):
		var triggerSprite = get_node("../AreaSprite")
		var Highlight = load("res://AreaHighlight.png")
		triggerSprite.texture = Highlight


func _on_body_exited(body: Node2D) -> void:
	if (body == get_node("../../../Player")):
		var triggerSprite = get_node("../AreaSprite")
		var RegSpirte = load("res://AreaTrigger.png")
		triggerSprite.texture = RegSpirte
