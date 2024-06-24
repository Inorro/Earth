extends Button

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func _on_pressed():
	get_tree().reload_current_scene()
