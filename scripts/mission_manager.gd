# Manage current mission and its information

extends Node

@onready var tmp_mission_file: NetworkElementDescription = preload("res://resources/missions/test_network.tres")


func trigger_network_generation():
	NetworkGenerator.clear_grid_container()
	load_mission(tmp_mission_file)
	
	
func load_mission(mission_file: NetworkElementDescription):
	SystemManager.init_current_system(mission_file)
	NetworkGenerator.generate_elem_network(SystemManager.current_system)
