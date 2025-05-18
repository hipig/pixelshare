@tool
extends FSMState

# Executes after the state is entered.
func _on_enter(actor, _blackboard: Blackboard):
	actor = actor as NPC
	actor.animated_sprite.play("idle_" + actor.dirction)
	actor.debug_msg("is idling")
