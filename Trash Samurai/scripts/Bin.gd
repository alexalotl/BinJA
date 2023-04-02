extends Area2D

@export_enum("Paper", "General", "Food", "Plastic", "Glass") var type: String

signal success
signal failure
# Called when the node enters the scene tree for the first time.
func _ready():
	var sprite = get_node("Recycle Bin")
	match type:
		"Paper":
			sprite.set_texture(load("res://assets/paper_bin.png"))
			
		"General":
			sprite.set_texture(load("res://assets/general_bin.png"))
			
		"Food":
			sprite.set_texture(load("res://assets/food_bin.png"))
			
		"Plastic":
			sprite.set_texture(load("res://assets/plastic_bin.png"))
			
		"Glass":
			sprite.set_texture(load("res://assets/glass_bin.png"))
			
		"Metal":
			sprite.set_texture(load("res://assets/metal_bin.png"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_body_entered(body):
	print(body.type)
	print(type)
	if body.is_in_group("rubbish"):
		if body.type == type:
			success.emit()
		else:
			failure.emit()
		body.free()
		#Global.increase_score()
