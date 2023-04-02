extends Label

var score =0

func _in_correct_bin():
	score += 1
	text = "Score: %s" %score
func _in_incorrect_bin():
	score -= 1
	text = "Score: %s" %score
