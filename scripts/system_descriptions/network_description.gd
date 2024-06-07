class_name NetworkDescription extends Resource

@export var elements: Array[NetworkElementDescription]

func _init(p_elements: Array[NetworkElementDescription] = []):
	elements = p_elements
