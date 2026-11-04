extends Resource
class_name AbilitiesList
#made by Alexande Lesur


@export var abilities: Dictionary[String,String]

func scan_quests(path: String = "res://Resources/Abilities/") -> void:
	abilities.clear()
	var dir := DirAccess.open(path)
	if not dir:
		push_warning("Abilities List: dossier introuvable '%s" % path)
		return
	
	for file in dir.get_files():
		if not file.ends_with(".tres"):
			continue
		var full_path := path + file
		var id := ResourceLoader.get_resource_uid(full_path)
		if id == ResourceUID.INVALID_ID:
			push_warning("AbilitiesList: uid introuvable pour '%s'" % full_path)
			continue
		var key := file.replace(".tres", "")
		abilities[key] = ResourceUID.id_to_text(id)
		
	for subdir in dir.get_directories():
		scan_quests(path + subdir + "/")

