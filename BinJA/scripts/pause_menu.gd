extends Control

@export var game: Node2D

func _ready():
	hide()
	process_mode = Node.PROCESS_MODE_ALWAYS
	get_tree().paused = false

func _unpause():
	hide()
	get_tree().paused = false
	
func _pause():
	get_tree().paused = true
	show()


