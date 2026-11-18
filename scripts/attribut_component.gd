extends Node
class_name AttributsComponent

signal attribut_changed(name:String, current: float, max_value: float, min_value: float)
signal attribut_empty(name: String)

@export var attributs: Scan

func _ready():
	attributs.scan_files("res://Attributs/");

func get_value(name: String)-> float:
	return 0.0

func change_value(name: String)-> void:
	pass

func has_attribut(name: String)-> bool:
	return true
