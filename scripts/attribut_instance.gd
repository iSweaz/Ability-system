extends RefCounted
class_name AttributInstance

signal changed(current: float, max_value: float)
signal emptied

var attribut: Attribut
var current_value: float
var _modifiers : Dictionary = {}

func _init(att: Attribut) -> void:
	attribut = att
	current_value = get_value()
	
func get_value() -> float:
	var flat:= 0.0
	var mult:= 1.0
	for m in _modifiers.values():
		flat += m.flat
		mult *= m.mult
	return maxf((attribut.base_value + flat) * mult, attribut.min_value)
	
func change(amount: float) -> void:
	if not attribut.consumable:
		return
	var val = current_value
	current_value = clampf(val + amount, attribut.base_value, get_value())
	changed.emit(current_value, get_value())
	if val > attribut.min_value and current_value <= attribut.min_value:
		emptied.emit()
	
func add_modifier(source: Object, flat:= 0.0, mult := 1.0)-> void:
	_modifiers[source] = {"flat": flat, "mult": mult}
	_refresh()
	
func remove_modifier(source: Object)-> void:
	_modifiers.erase(source)
	_refresh()

func _refresh()-> void:
	if attribut.consumable:
		current_value = minf(current_value, get_value())
	changed.emit(current_value, get_value())
