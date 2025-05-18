@tool
extends FSMState

# Executes after the state is entered.
func _on_enter(actor, _blackboard: Blackboard):
	actor = actor as NPC
	actor.debug_msg("is walking")

# Executes every _process call, if the state is active.
func _on_update(_delta, actor, _blackboard: Blackboard):
	actor = actor as NPC
	actor.animated_sprite.play("walk_" + actor.dirction)
	pass
