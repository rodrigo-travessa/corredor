extends Node2D

@onready var player_spawn_point: Marker2D = $PlayerSpawnPoint

func _ready() -> void:
	var player = PlayerManager.get_player()
	player.global_position = player_spawn_point.global_position
	add_child(player)
