extends RigidBody2D

var type: String

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())
	var destination = get_global_mouse_position()
	position = destination
	pass
