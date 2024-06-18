class_name SystemElementDescription extends Resource

enum SystemElementType {
	NONE,
	NETWORK,
	DIRECTORY,
	FILE,
}

enum ElementInteractionType { 
	NONE, 
	TO_DELETE, 
	TO_COPY, 
	TO_CORRUPT,
}

@export var guid: String
@export var name: String
# Maybe auto set element_type based on virtual method that child override
@export var element_type: SystemElementType
@export var description: String
@export var interaction_type: ElementInteractionType
@export var protections: Array[ElementProtectionDescription]

var parent_element: SystemElementDescription

func _init(
	p_guid = "",
	p_name = "",
	p_element_type = SystemElementType.NONE,
	p_description = "",
	p_interaction_type = ElementInteractionType.NONE,
	p_protections: Array[ElementProtectionDescription] = []
):
	guid = p_guid
	name = p_name
	element_type = p_element_type
	description = p_description
	interaction_type = p_interaction_type
	protections = p_protections
	
	parent_element = null

func get_str_description(level: int = 1) -> String:
	var level_str: String = ""
	for i in range(level):
		level_str += "---"
	
	var str_desc = level_str + "[SystemElementDescription]\n"
	str_desc += level_str + "GUID: " + guid + "\n"
	str_desc += level_str + "Name: " + name + "\n"
	str_desc += level_str + "Element type: " + str(element_type) + "\n"
	str_desc += level_str + "Description: " + description + "\n"
	str_desc += level_str + "Interaction type: " + str(interaction_type) + "\n"
	str_desc += level_str + "Protections: TODO" + "\n"
	#str_desc += "\n"
	return str_desc
