extends Node2D
class_name WeaponBase

@export var weapon_sprite: Sprite2D
@export var animation_player: AnimationPlayer
@export var timer: Timer
@export var multishot_angle: int
@export var bullet_scene: PackedScene

const degree_to_radian = 0.017

var player: Player
var player_stats: PlayerStats = PlayerStats.new()

var weapon_base_damage: float
var weapon_base_attack_speed: float
var weapon_base_multishot: int
var weapon_clip_size: int
var weapon_reload_time: float

var weapon_can_shoot: bool = true


func _ready() -> void:
	player = PlayerManager.get_player()
	player_stats = PlayerManager.get_player_stats()
	timer.wait_time = 100/player_stats.base_attack_speed
	timer.autostart = false
	timer.one_shot = true

func shoot_bullet():
	if timer.is_stopped():
		var direction = global_position.direction_to(get_global_mouse_position())
		var additional_multi_angle  = ((player.global_position - get_global_mouse_position() ).length()) / 100
		for i in range(player_stats.base_multishot):
			var magnitude = i + 1
			var deviation = magnitude * 15
			var clamped_angle = degree_to_radian * clampf((multishot_angle - additional_multi_angle), 1, 25)
			var positive_direction = Vector2.from_angle(direction.angle() + clamped_angle * magnitude)
			var negative_direction = Vector2.from_angle(direction.angle() - clamped_angle * magnitude)
			create_bullet(positive_direction)
			create_bullet(negative_direction)

		var bullet:Node2D = bullet_scene.instantiate()
		bullet.global_position = global_position
		bullet.direction = direction
		bullet.call_deferred("update_damage", player_stats.base_attack_damage)
		get_tree().root.add_child(bullet)
		timer.start()

func reload():
	pass

func update_weapon_stats(new_player_stats):
	player_stats = new_player_stats
	timer.wait_time = 100/player_stats.base_attack_speed

func create_bullet(direction):
		var bullet:Node2D = bullet_scene.instantiate()
		bullet.global_position = global_position
		bullet.direction = direction
		bullet.call_deferred("update_damage", player_stats.base_attack_damage)
		get_tree().root.add_child(bullet)
