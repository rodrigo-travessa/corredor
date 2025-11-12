extends Node2D
class_name Bullet

@onready var area_2d: Area2D = $Area2D
@onready var timer: Timer = $Timer
@export var speed : int = 1000

@onready var hitbox: HitboxComponent = $Hitbox

var direction : Vector2 = Vector2.ZERO

func _ready() -> void:
	area_2d.area_entered.connect(on_area_entered)
	timer.timeout.connect(on_timeout)

func _process(delta: float) -> void:
	global_position += direction * speed * delta

func on_timeout():
	queue_free()

func on_area_entered(_other_area):
	queue_free()

func update_damage(value : int):
	hitbox.damage = value
