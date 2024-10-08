extends Node

@onready var main_canvas_layer: CanvasLayer = get_node("../MainScene/MainCanvasLayer")

func get_grid_container() -> GridContainer:
	return main_canvas_layer.get_node("GridContainer")
	
func get_file_description_window() -> FileDescriptionWindow:
	return main_canvas_layer.get_node("FileDescriptionWindow")
