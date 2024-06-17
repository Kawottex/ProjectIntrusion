class_name FileDescriptionWindow extends Control


@export var file_name_label: Label
@export var file_description_label: Label

var file_elem_desc: FileElementDescription

func set_file(p_file_elem_desc: FileElementDescription):
	file_elem_desc = p_file_elem_desc
	file_name_label.text = file_elem_desc.name
	file_description_label.text = file_elem_desc.description
