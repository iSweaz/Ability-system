class_name Effect
extends RefCounted

var tag: StringName = &""   # sert aux immunités ("burn", "freeze"...)
var duration := 1.0
var interval := 0.0         # 0 = pas de tick périodique

var elapsed := 0.0
var tick_accumulator := 0.0

func on_start(_target: Ennemies) -> void: pass
func on_tick(_target: Ennemies) -> void: pass
func on_end(_target: Ennemies) -> void: pass
func get_speed_multiplier() -> float: return 1.0
