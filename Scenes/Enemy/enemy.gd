extends CharacterBody2D
class_name Enemy

@onready var health_component: HealthComponent = $HealthComponent
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	health_component.died.connect(on_died)

func _process(_delta: float) -> void:
	if velocity.x > 0:
		animated_sprite_2d.flip_h = false
	else:
		animated_sprite_2d.flip_h = true

func _physics_process(_delta: float) -> void:
	move_and_slide()

func on_died():
	queue_free()
