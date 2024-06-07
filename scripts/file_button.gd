class_name FileButton extends Control

@export var main_button: Button
@export var main_label: Label

func _ready():
	main_button.pressed.connect(_on_main_button_pressed)


func _on_main_button_pressed():
	pass
