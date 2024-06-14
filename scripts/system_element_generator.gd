extends Node

@onready var grid_container = UIManager.get_grid_container()
@onready var file_button_scene = preload("res://scenes/sys_elem_button.tscn")

@export var elements_icons: Dictionary


func generate_system_element(element_desc: SystemElementDescription, click_callback: Callable) -> SysElemButton:
	# Common behaviour
	var new_file_button: SysElemButton = file_button_scene.instantiate()
	grid_container.add_child(new_file_button)
	new_file_button.main_label.text = element_desc.name
	new_file_button.main_button.pressed.connect(click_callback.bind(element_desc))
	new_file_button.sys_elem_description = element_desc
	
	# Specific behaviour
	match element_desc.element_type:
		SystemElementDescription.SystemElementType.DIRECTORY:
			generate_directory_element(new_file_button, element_desc)
		SystemElementDescription.SystemElementType.FILE:
			generate_file_element(new_file_button, element_desc)
	
	return new_file_button

func generate_directory_element(directory_button: SysElemButton, folder_desc: DirectoryElementDescription):
	directory_button.main_button.icon = elements_icons[folder_desc.element_type]
	if folder_desc.is_prev_dir:
		directory_button.main_label.text = ".."
	
	
func generate_file_element(file_button: SysElemButton, file_desc: FileElementDescription):
	file_button.main_button.icon = elements_icons[file_desc.element_type]
	
