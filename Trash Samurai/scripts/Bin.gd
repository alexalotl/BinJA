extends Area2D

@export_enum("Paper", "Food", "Plastic") var type: String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_body_entered(body):
	if body.is_in_group("rubbish"):
		body.free()
		Global.increase_score()
	pass # Replace with function body.
