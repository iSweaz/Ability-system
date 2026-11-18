class_name FreezeEffect
extends Effect

func _init(p_duration: float) -> void:
	tag = &"freeze"
	duration = p_duration

func get_speed_multiplier() -> float:
	return 0.0
