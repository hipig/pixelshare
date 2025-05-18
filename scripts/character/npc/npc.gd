extends CharacterBody2D
class_name NPC

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var finite_state_machine: FiniteStateMachine = $FiniteStateMachine


var dirction: String = "down"
		
var speed: float = 50

var nearest_interactable: Node2D = null
		
func _ready() -> void:
	finite_state_machine.start()
	
func _process(delta: float) -> void:
	if navigation_agent.is_navigation_finished():
		velocity = Vector2.ZERO
		return	
		
	var target_position: Vector2 = navigation_agent.get_next_path_position()
	var target_direction: Vector2 = global_position.direction_to(target_position)
	
	velocity = target_direction * speed
	update_dirction()
	move_and_slide()
		

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		navigation_agent.target_position = get_global_mouse_position()
		navigation_agent.target_position = navigation_agent.get_final_position()

func update_dirction():
	var x = abs(velocity.x)
	var y = abs(velocity.y)
	if x > y:
		if velocity.x > 0:
			dirction = "right"
		else:
			dirction = "left"
	elif x < y:
		if velocity.y > 0:
			dirction = "down"
		else:
			dirction = "up"
	print(dirction)		

func debug_msg(text: String):
	print(text)
