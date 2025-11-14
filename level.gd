extends Node2D

@onready var trees: Node2D = $Trees
@onready var enemies: Node2D = $"../Enemies"
@onready var spawner_marker: Marker2D = $"../SpawnerMarker"
@onready var timer: Timer = $Timer
@onready var enemy_spawn_timer: Timer = $EnemySpawnTimer
@onready var upgrade_spawn_timer: Timer = $UpgradeSpawnTimer
@onready var level: Node2D = $"."
@onready var timer_label: Label = $"../Control/VBoxContainer/HBoxContainer/Timer Label"
@onready var kill_count_label: Label = $"../Control/VBoxContainer/HBoxContainer/Kill Count Label"
@onready var upgrade_gates_holder: Node2D = $UpgradeGatesHolder

@export var enemy_scene : PackedScene
@export var upgrade_gates_scene : PackedScene
var level_timer: float


var spawned_count: int = 0

func _ready() -> void:
	enemy_spawn_timer.timeout.connect(on_enemy_timer_timeout)
	upgrade_spawn_timer.timeout.connect(on_upgrade_spawn_timer_timeout)

func _process(delta: float) -> void:
	level_timer += delta
	timer_label.text = "Timer: %d" % level_timer

func on_enemy_timer_timeout():
	var new_timer = enemy_spawn_timer.wait_time - (enemy_spawn_timer.wait_time * spawned_count/500)
	enemy_spawn_timer.wait_time = clampf(new_timer, 0.2, 2)
	print(enemy_spawn_timer.wait_time)

	spawned_count += 1
	var new_enemy: Enemy = enemy_scene.instantiate()
	new_enemy.global_position = spawner_marker.global_position + Vector2(randf_range(-575.0, 575.0), 0)
	enemies.add_child(new_enemy)

func on_upgrade_spawn_timer_timeout():
	var upgrade_gates : UpgradeGates = upgrade_gates_scene.instantiate()
	upgrade_gates.global_position = spawner_marker.global_position
	upgrade_gates_holder.add_child(upgrade_gates)
