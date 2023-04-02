extends RigidBody2D

@export_enum("Paper", "General", "Food", "Plastic", "Glass", "Metal") var type: String

var isSelected: bool = false

signal missed()

func _ready():
	set_freeze_mode(FREEZE_MODE_STATIC)
	var sprite = get_node("Sprite")
	var rng = RandomNumberGenerator.new()
	match type:
		"Paper":
			var selection = ["Paper", "Pizza Box"][rng.randi()%2]
			match selection:
				"Paper":
					sprite.set_texture(load("res://assets/paper.png"))
					
				"Pizza Box":
					sprite.set_texture(load("res://assets/pizza_box.png"))
		"General":
			var selection = ["Bulb", "Chips", "Coffee", "Glass", "Pizza"][rng.randi()%5]
			match selection:
				"Bulb":
					sprite.set_texture(load("res://assets/bulb.png"))
				"Chips":
					sprite.set_texture(load("res://assets/chips.png"))
				"Coffee":
					sprite.set_texture(load("res://assets/coffee_cup.png"))
				"Glass":
					sprite.set_texture(load("res://assets/drinking_glass.png"))
				"Pizza":
					sprite.set_texture(load("res://assets/greasy_pizza_box.png"))
			
		"Food":
			var selection = ["Banana", "Bread"][rng.randi()%2]
			match selection:
				"Banana":
					sprite.set_texture(load("res://assets/banana_peel.png"))
				"Bread":
					sprite.set_texture(load("res://assets/bread.png"))
			
		"Plastic":
			var selection = ["Spray", "Milk"][rng.randi()%2]
			match selection:
				"Spray":
					sprite.set_texture(load("res://assets/spray_bottle.png"))
				"Milk":
					sprite.set_texture(load("res://assets/milk_carton.png"))
			
		"Glass":
			sprite.set_texture(load("res://assets/glass_bottle.png"))
			
		"Metal":
			var selection = ["Foil", "Can"][rng.randi()%2]
			match selection:
				"Foil":
					sprite.set_texture(load("res://assets/foil.png"))
				"Can":
					sprite.set_texture(load("res://assets/tin_can.png"))
			

func _process(delta):
	pass

func _physics_process(delta):
	if isSelected:
		global_transform.origin = get_global_mouse_position()
	if global_transform.origin.x < -150 || global_transform.origin.x > 1350:
		missed.emit()
		queue_free()
	
func pickup():
	set_freeze_enabled(true)
	isSelected = true
	
func drop(impulse=Vector2.ZERO):
	set_freeze_enabled(false)
	apply_central_impulse(impulse)
	isSelected = false


func _on_pickable_collider_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch:
		print("Input Received")
		if event.pressed:
			pickup()
		elif isSelected:
			drop(Input.get_last_mouse_velocity())
