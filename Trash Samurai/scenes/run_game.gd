extends Node2D

var _rubbish
# Called when the node enters the scene tree for the first time.
func _ready():
	_rubbish = load("res://scenes/rubbish.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_timer_timeout():
	var rubbish = _rubbish.instantiate()
	rubbish.position = Vector2(-100, 500)
	add_child(rubbish)
	pass # Replace with function body.
