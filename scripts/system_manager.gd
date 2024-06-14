extends Node

var current_system: NetworkElementDescription

func init_current_system(p_system: NetworkElementDescription):
	current_system = p_system.duplicate(true)
	
func delete_system_element(p_elem: SystemElementDescription):
	if p_elem.parent_element is DirectoryElementDescription:
		p_elem.parent_element.remove_child(p_elem)
