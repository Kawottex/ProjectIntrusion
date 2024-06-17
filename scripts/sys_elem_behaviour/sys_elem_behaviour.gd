class_name SysElemBehaviour extends Object

var sys_elem_description: SystemElementDescription

func _init(p_sys_elem_description: SystemElementDescription):
	sys_elem_description = p_sys_elem_description

func execute_behaviour():
	print("No behaviour implemented for this sys element")
	