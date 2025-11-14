extends Camera2D

@export var SPEED : int = 0
func _process(delta: float) -> void:
	global_position.y -= SPEED * delta
