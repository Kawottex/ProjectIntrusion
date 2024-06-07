extends Node

@export var grid_container: GridContainer
@export var test_network: NetworkElementDescription
@export var system_element_generator: SystemElementGenerator


func _ready():
	clear_grid_container()
	generate_elem_network(test_network)


func generate_elem_network(network_desc: NetworkElementDescription):
	var click_callback: Callable = Callable(self, "generate_network_element_content")
	system_element_generator.generate_system_element(network_desc, click_callback)


func generate_elem_directory(dir_desc: DirectoryDescription, is_prev_dir: bool = false):
	var click_callback: Callable = Callable(self, "generate_directory_content")
	dir_desc.is_prev_dir = is_prev_dir
	system_element_generator.generate_system_element(dir_desc, click_callback)


func generate_elem_file(file_desc: FileDescription):
	var click_callback: Callable = Callable(self, "display_file_info")
	system_element_generator.generate_system_element(file_desc, click_callback)


func generate_network_element_content(network_elem_desc: NetworkElementDescription):
	var root_directory: DirectoryDescription = network_elem_desc.root_directory
	generate_directory_content(root_directory)
	
func generate_directory_content(dir_desc: DirectoryDescription):
	clear_grid_container()
	
	# Clear previous directory flag
	dir_desc.is_prev_dir = false
	
	if dir_desc.parent_element != null:
		generate_elem_directory(dir_desc.parent_element, true)
	
	for elem_desc in dir_desc.directory_content:
		if elem_desc is DirectoryDescription:
			generate_elem_directory(elem_desc)
		elif elem_desc is FileDescription:
			generate_elem_file(elem_desc)


func display_file_info(file_desc: FileDescription):
	print("file desc: " + file_desc.description)


func clear_grid_container():
	for child in grid_container.get_children():
		grid_container.remove_child(child)
		child.queue_free()
