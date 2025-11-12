extends Node

@onready var player_scene : PackedScene = preload("uid://f4nuyix342yu")
var player_stats: PlayerStats

var player_instance : Player

func _ready() -> void:
	player_instance = player_scene.instantiate()
	player_stats = load_player_stats()

func get_player():
	if !player_instance:
		player_instance = player_scene.instantiate()
	return player_instance

func get_player_position():
	return player_instance.global_position

func get_player_stats():
	return player_stats

func load_player_stats():
	return PlayerStats.new()
