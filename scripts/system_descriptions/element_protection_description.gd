class_name ElementProtectionDescription extends Resource

enum ProtectionType {
	NONE,
	PASSWORD
}

@export var type: ProtectionType
@export var content: String

func _init(p_type = ProtectionType.NONE, p_content = ""):
	type = p_type
	content = p_content
