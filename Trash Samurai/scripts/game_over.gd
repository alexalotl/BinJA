extends Control

@export var score_label: Label

func _ready():
	score_label.text = "Score: " + str(Global.most_recent_score)
