class_name DirectoryDescription extends SystemElementDescription

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
