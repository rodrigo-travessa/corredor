extends CharacterBody2D
class_name Player

@export var initial_weapon: PackedScene
@export var current_weapon: WeaponBase


var player_stats : PlayerStats


func _ready() -> void:
	current_weapon = initial_weapon.instantiate()
	add_child(current_weapon)
	player_stats = PlayerManager.get_player_stats()


func _process(_delta: float) -> void:
	if Input.is_action_pressed("attack"):
		current_weapon.shoot_bullet()
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction.normalized() * player_stats.base_speed
	move_and_slide()

func update_weapon_stats():
	current_weapon.update_weapon_stats(player_stats)
