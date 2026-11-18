class_name BurnEffect
extends Effect

var damage: float

func _init(p_damage: float, p_duration: float, p_interval: float = 1.0) -> void:
	tag = &"burn"
	damage = p_damage
	duration = p_duration
	interval = p_interval

func on_tick(target: Ennemies) -> void:
	target.vie -= damage
