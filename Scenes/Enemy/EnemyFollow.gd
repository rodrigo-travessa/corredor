extends State
class_name EnemyFollow

@export var Parent : CharacterBody2D
@export var move_speed : float = 70

var player : CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("player")

func Update_Physics(_delta: float):
	var direction = player.global_position - Parent.global_position
	Parent.velocity = direction.normalized() * move_speed

	if direction.length() > 250:
		TransitionTo.emit(self, "idle")
