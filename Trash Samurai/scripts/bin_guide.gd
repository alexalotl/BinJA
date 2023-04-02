extends Control

@export_enum("Paper", "General", "Food", "Plastic", "Glass", "Metal") var type: String

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

