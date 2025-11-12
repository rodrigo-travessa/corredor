extends Camera2D

@export var SPEED : int = 50
func _process(delta: float) -> void:
	global_position.y -= SPEED * delta
