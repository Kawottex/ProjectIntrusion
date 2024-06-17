class_name DeleteFileCommand extends HackCommand

var command_description: HackCommandDescription

func _init():
	command_description = preload("res://resources/hack_commands/delete_file_command.tres")
	
func mouse_execute():
	var selected_file: FileElementDescription = SystemManager.current_selected_file
	if selected_file != null:
		delete_file(selected_file)
	else:
		print("Can't execute delete command, no file selected")


func cli_execute(arg):
	delete_file(arg)


func delete_file(file_to_delete):
	SystemManager.delete_system_element(file_to_delete)
