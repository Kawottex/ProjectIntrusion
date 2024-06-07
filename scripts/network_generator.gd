extends Node

@export var grid_container: GridContainer
@export var test_network: NetworkElementDescription

var file_button_scene

func _ready():
	file_button_scene = preload("res://scenes/FileButton.tscn")
	generate_elem_network(test_network)


func generate_elem_network(network_desc: NetworkElementDescription):
	clear_grid_container()
	var new_elem_network_button: FileButton = generate_file_button("Network Element Root", "")
	var root_directory: DirectoryDescription = network_desc.root_directory
	new_elem_network_button.main_button.pressed.connect(generate_directory_content.bind(root_directory))


func generate_elem_directory(dir_desc: DirectoryDescription, is_prev_dir: bool = false):
	var dir_name = ".." if is_prev_dir else dir_desc.name
	var new_dir_button: FileButton = generate_file_button(dir_name, dir_desc.description)
	new_dir_button.main_button.pressed.connect(generate_directory_content.bind(dir_desc))


func generate_elem_file(file_desc: FileDescription):
	generate_file_button(file_desc.name, file_desc.description)


func generate_file_button(button_text: String, label_text: String) -> FileButton:
	var new_file_button: FileButton = file_button_scene.instantiate()
	grid_container.add_child(new_file_button)
	new_file_button.main_button.text = button_text
	new_file_button.main_label.text = label_text
	return new_file_button


func generate_directory_content(dir_desc: DirectoryDescription):
	clear_grid_container()
	
	if dir_desc.parent_element != null:
		generate_elem_directory(dir_desc.parent_element, true)
	
	for elem_desc in dir_desc.directory_content:
		if elem_desc is DirectoryDescription:
			generate_elem_directory(elem_desc)
		elif elem_desc is FileDescription:
			generate_elem_file(elem_desc)


func clear_grid_container():
	for child in grid_container.get_children():
		grid_container.remove_child(child)
		child.queue_free()
