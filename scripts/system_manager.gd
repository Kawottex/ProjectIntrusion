extends Node

var current_system: NetworkElementDescription
var current_directory: DirectoryElementDescription
var current_selected_file: FileElementDescription


func init_current_system(p_system: NetworkElementDescription):
	current_system = p_system.duplicate(true)
	

func delete_system_element(p_elem: SystemElementDescription):
	if p_elem.parent_element is DirectoryElementDescription:
		p_elem.parent_element.remove_child(p_elem)
		refresh_current_directory()


func set_current_selected_file(p_current_selected_file: FileElementDescription):
	current_selected_file = p_current_selected_file


func set_current_directory(p_current_directory: DirectoryElementDescription):
	print("curr dir: " + p_current_directory.name)
	current_directory = p_current_directory


func refresh_current_directory():
	print(current_directory.get_str_description())
	NetworkGenerator.generate_directory_content(current_directory)
