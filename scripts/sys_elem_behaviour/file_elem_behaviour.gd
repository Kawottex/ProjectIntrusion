class_name FileElemBehaviour extends SysElemBehaviour

func execute_behaviour():
	var file_desc_win : FileDescriptionWindow = UIManager.get_file_description_window()
	file_desc_win.set_file(sys_elem_description)
	SystemManager.set_current_selected_file(sys_elem_description)
