extends Node

var most_recent_score = 0:
	set(value):
		most_recent_score = value
		if most_recent_score > high_score:
			high_score = most_recent_score
		

var high_score = 0

