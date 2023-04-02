extends Button


func _toggled(button_pressed):
	get_tree().change_scene("res://pause_popupmenu.tscn")
