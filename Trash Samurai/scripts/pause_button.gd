extends Button

signal pause()

func _pressed():
	pause.emit()
