class_name FileDescription extends SystemElementDescription

#region Enum descriptions
enum FileType { 
	NONE, 
	ANTIVIRUS1, 
	ANTIVIRUS2, 
	TXT, 
	MP3,
}

enum FileSubType { 
	NONE, 
	MISSION_MANDATORY, 
	MISSION_OPTIONAL, 
	REWARD,
}
#endregion

@export var file_type: FileType
@export var file_sub_type: FileSubType
# LinkedFiles

func _init(p_file_type = FileType.NONE, p_file_sub_type = FileSubType.NONE):
	file_type = p_file_type
	file_sub_type = p_file_sub_type
