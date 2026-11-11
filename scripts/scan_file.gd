extends Resource
class_name Scan
#made by Alexande Lesur


@export var data: Dictionary[String,String]

func scan_files(path: String) -> void:
	data.clear()
	var dir := DirAccess.open(path)
	if not dir:
		push_warning("Scan: dossier introuvable '%s'" % path)
		return
	
	for file in dir.get_files():
		if not file.ends_with(".tres"):
			continue
		var full_path := path + file
		var id := ResourceLoader.get_resource_uid(full_path)
		if id == ResourceUID.INVALID_ID:
			push_warning("Scan: uid introuvable pour '%s'" % full_path)
			continue
		var key := file.replace(".tres", "")
		data[key] = ResourceUID.id_to_text(id)
		
	for subdir in dir.get_directories():
		scan_files(path + subdir + "/")
