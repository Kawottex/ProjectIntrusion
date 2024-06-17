class_name SysElemButton extends Control

@export var main_button: Button
@export var main_label: Label

var sys_elem_description: SystemElementDescription
var sys_elem_behaviour: SysElemBehaviour


func with_data(p_sys_elem_desc: SystemElementDescription) -> SysElemButton:
	sys_elem_description = p_sys_elem_desc
	return self


func _ready():
	sys_elem_behaviour = create_sys_elem_behaviour(sys_elem_description)
	main_button.pressed.connect(_on_main_button_pressed)


func _on_main_button_pressed():
	sys_elem_behaviour.execute_behaviour()


func create_sys_elem_behaviour(sys_elem_desc: SystemElementDescription) -> SysElemBehaviour:
	match sys_elem_desc.element_type:
		SystemElementDescription.SystemElementType.NETWORK:
			return NetworkElemBehaviour.new(sys_elem_desc)
		SystemElementDescription.SystemElementType.DIRECTORY:
			return DirectoryElemBehaviour.new(sys_elem_desc)
		SystemElementDescription.SystemElementType.FILE:
			return FileElemBehaviour.new(sys_elem_desc)
	return null