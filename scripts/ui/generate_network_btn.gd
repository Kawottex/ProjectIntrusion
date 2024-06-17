extends Button


func _pressed():
	MissionManager.trigger_network_generation()
