extends Area2D
class_name InteractableArea

func _ready() -> void:
	body_entered.connect(_body_entered)
	body_exited.connect(_body_exited)
	
func _body_entered(body: Node2D) -> void:
	if body is NPC:
		body.nearest_interactable = get_parent()
	
func _body_exited(body: Node2D) -> void:
	if body is NPC:
		if body.nearest_interactable == get_parent():
			body.nearest_interactable = null
