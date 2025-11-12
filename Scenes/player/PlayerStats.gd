extends Resource
class_name PlayerStats

@export var base_speed:float = 400
@export var base_health:float = 5
@export var base_armor:float = 0
@export var base_attack_damage:float = 10
@export var base_attack_speed:float = 100
@export var base_multishot:int = 0

var speed:float
var health:float
var armor:float
var attack_damage:float
var attack_speed:float
var multishot:int

func _init() -> void:
	speed = base_speed
	health = base_health
	armor = base_armor
	attack_damage = base_attack_damage
	attack_speed = base_attack_speed
	multishot = base_multishot
