extends Control


@export var main_button: Button
var hack_command: HackCommand


func _init(p_hack_command):
	hack_command = p_hack_command
	main_button.icon = hack_command.command_description.command_icon
	main_button.pressed.connect(_main_button_pressed)


func _main_button_pressed():
	hack_command.mouse_execute()