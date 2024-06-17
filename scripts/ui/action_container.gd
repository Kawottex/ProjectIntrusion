extends Control

@onready var hack_command_button_scene = preload("res://scenes/hack_command_button.tscn")

@export var box_container: HBoxContainer


func _ready():
	generate_action_container()


func generate_action_container():
	var test_action_delete: HackCommandButton = hack_command_button_scene.instantiate().with_data(DeleteFileCommand.new())
	box_container.add_child(test_action_delete)
