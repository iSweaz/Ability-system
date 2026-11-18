extends Node
class_name Ennemies

@export var immunities: Array[StringName] = []  

@export var vie := 100.0
@export var base_speed := 100.0

var _effects: Array[Effect] = []

func add_effect(effect: Effect) -> void:
	if effect.tag in immunities:
		return
	_effects.append(effect)
	effect.on_start(self)

func get_speed() -> float:
	var result := base_speed
	for effect in _effects:
		result *= effect.get_speed_multiplier()
	return result

func _process(delta: float) -> void:
	for effect in _effects.duplicate():   
		effect.elapsed += delta

		if effect.interval > 0.0:
			effect.tick_accumulator += delta
			while effect.tick_accumulator >= effect.interval:
				effect.tick_accumulator -= effect.interval
				effect.on_tick(self)

		if effect.elapsed >= effect.duration:
			effect.on_end(self)
			_effects.erase(effect)
