class_name DeleteFileCommand extends HackCommand

var command_description: HackCommandDescription

func _init():
	command_description = preload("res://resources/hack_commands/delete_file_command.tres")
	
func mouse_execute():
	# Get selected file
	var arg = 0
	delete_file(arg)

func cli_execute(arg):
	delete_file(arg)

func delete_file(file_to_delete):
	SystemManager.delete_system_element(file_to_delete)