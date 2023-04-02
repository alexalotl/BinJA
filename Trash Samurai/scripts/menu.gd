extends Control


@export var high_score_label: Label
@export var recent_score_label: Label

func _ready():
	high_score_label.text = "High Score\n" + str(Global.high_score) 
	recent_score_label.text = "Most \nRecent Score\n" + str(Global.most_recent_score)
