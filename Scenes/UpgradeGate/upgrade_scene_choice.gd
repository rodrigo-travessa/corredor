extends Node2D
class_name UpgradeGates

@onready var upgrade_scene_choice: UpgradeGates = $"."

@onready var upgrade_gate_1: Node2D = $UpgradeGate1
@onready var upgrade_gate_2: Node2D = $UpgradeGate2
@onready var upgrade_gate_3: Node2D = $UpgradeGate3
@onready var upgrade_1: Area2D = $"Upgrade 1"
@onready var upgrade_2: Area2D = $"Upgrade 2"
@onready var upgrade_3: Area2D = $"Upgrade 3"


func _ready() -> void:
	var label1:Label = upgrade_gate_1.get_node("Label")
	var label2:Label = upgrade_gate_2.get_node("Label")
	var label3:Label = upgrade_gate_3.get_node("Label")
	label1.text = "Damage"
	label2.text = "Attack Speed"
	label3.text = "MultiShot"
	upgrade_1.area_entered.connect(on_area1_entered)
	upgrade_2.area_entered.connect(on_area2_entered)
	upgrade_3.area_entered.connect(on_area3_entered)

func on_area1_entered(other):
	if other.get_parent() is Player:
		other.get_parent().player_stats.base_attack_damage += 5
		other.get_parent().update_weapon_stats()
		queue_free()

func on_area2_entered(other):
	if other.get_parent() is Player:
		other.get_parent().player_stats.base_attack_speed += 400
		other.get_parent().update_weapon_stats()
		queue_free()

func on_area3_entered(other):
	if other.get_parent() is Player:
		other.get_parent().player_stats.base_multishot += 1
		other.get_parent().update_weapon_stats()
		queue_free()
