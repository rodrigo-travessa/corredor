extends Node
class_name HitboxComponent

signal hit_hurtbox(hurtbox_component: HurtboxComponent)

var damage:int = 1
var is_hit_handled: bool

func register_hurtbox_hit(hurtbox_that_was_hit: HurtboxComponent):
	hit_hurtbox.emit(hurtbox_that_was_hit)
	get_parent().queue_free()
