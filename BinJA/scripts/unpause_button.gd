extends Button

signal unpause()

func _pressed():
	print("U1")
	unpause.emit()
