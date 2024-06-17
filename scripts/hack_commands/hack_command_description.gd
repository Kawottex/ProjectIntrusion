class_name HackCommandDescription extends Resource

enum HackCommandType {
	NONE,
	DELETE_FILE,
}

@export var command_name: String
@export var command_line_key: String
@export var command_type: HackCommandType
@export var command_icon: Resource


func _init(
	p_command_name = "",
	p_command_type = HackCommandType.NONE,
	p_command_icon = null
):
	command_name = p_command_name
	command_type = p_command_type
	command_icon = p_command_icon
