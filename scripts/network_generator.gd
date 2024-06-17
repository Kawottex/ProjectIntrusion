# Generate a network content

extends Node

@onready var grid_container = UIManager.get_grid_container()


func _ready():
	clear_grid_container()


func generate_elem_network(network_desc: NetworkElementDescription):
	SysElemGenerator.generate_system_element(network_desc)


func generate_elem_directory(dir_desc: DirectoryElementDescription, is_prev_dir: bool = false):
	dir_desc.is_prev_dir = is_prev_dir
	SysElemGenerator.generate_system_element(dir_desc)


func generate_elem_file(file_desc: FileElementDescription):
	SysElemGenerator.generate_system_element(file_desc)


func generate_directory_content(dir_desc: DirectoryElementDescription):
	clear_grid_container()
	
	# Clear previous directory flag
	dir_desc.is_prev_dir = false
	
	if dir_desc.parent_element != null:
		generate_elem_directory(dir_desc.parent_element, true)
	
	for elem_desc in dir_desc.directory_content:
		if elem_desc is DirectoryElementDescription:
			generate_elem_directory(elem_desc)
		elif elem_desc is FileElementDescription:
			generate_elem_file(elem_desc)


func clear_grid_container():
	for child in grid_container.get_children():
		grid_container.remove_child(child)
		child.queue_free()
