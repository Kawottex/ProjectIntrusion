class_name SysElemButton extends Control

@export var main_button: Button
@export var main_label: Label

var sys_elem_description: SystemElementDescription


func _ready():
	main_button.pressed.connect(_on_main_button_pressed)


func _on_main_button_pressed():
	# TODO: Display selected file and register it somewhere
	# to be used by delete_file_command
	pass
