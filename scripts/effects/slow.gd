class_name SlowEffect
extends Effect

var factor: float

func _init(p_factor: float, p_duration: float) -> void:
	tag = &"slow"
	factor = p_factor
	duration = p_duration

func get_speed_multiplier() -> float:
	return factor
