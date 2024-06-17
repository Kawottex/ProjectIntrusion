class_name NetworkElemBehaviour extends SysElemBehaviour

func execute_behaviour():
	var root_directory: DirectoryElementDescription = sys_elem_description.root_directory
	SystemManager.set_current_directory(root_directory)
	NetworkGenerator.generate_directory_content(root_directory)
