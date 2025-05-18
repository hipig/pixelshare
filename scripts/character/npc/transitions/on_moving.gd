@tool
extends FSMTransition

# Evaluates true, if the transition conditions are met.
func is_valid(actor, _blackboard: Blackboard):
	actor = actor as NPC
	return actor.velocity.length() > 0
