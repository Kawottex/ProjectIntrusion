class_name DirectoryElementDescription extends SystemElementDescription

@export var directory_content: Array[SystemElementDescription]
@export var is_root: bool

var is_prev_dir: bool = false

func _init(p_directory_content: Array[SystemElementDescription] = [], p_is_root = false):
	directory_content = p_directory_content
	is_root = p_is_root
	
	call_deferred("set_content_parent")

func set_content_parent():
	for elem in directory_content:
		elem.parent_element = self


func remove_child(p_child: SystemElementDescription):
	if p_child in directory_content:
		directory_content.erase(p_child)


func get_str_description(level: int = 1) -> String:
	var level_str: String = ""
	for i in range(level):
		level_str += "---"

	var str_desc = super(level)
	#str_desc += level_str + "[DirectoryElementDescription]\n"
	str_desc += level_str + "Is Root: " + str(is_root) + "\n"
	str_desc += level_str + "Directory content:\n"
	for sys_elem in directory_content:
		str_desc += sys_elem.get_str_description(level + 1)
		str_desc += "\n"
	return str_desc
