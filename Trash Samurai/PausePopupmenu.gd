extends Control

var game_paused = false setget set_paused
func  button_pressed():
	if 
func set_paused(value):
	game_paused =value
	get_tree().paused = game_paused
	visible = game_paused
