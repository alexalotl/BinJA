extends RigidBody2D

@export_enum("Paper", "General", "Food", "Plastic", "Glass", "Metal") var type: String

var isSelected: bool = false

signal missed()

func _ready():
	set_freeze_mode(FREEZE_MODE_STATIC)
	var sprite = get_node("Sprite")
	match type:
		"Paper":
			sprite.set_texture(load("res://assets/paper.png"))
			sprite.set_texture(load("res://assets/pizza_box.png"))
			
		"General":
			sprite.set_texture(load("res://assets/bulb.png"))
			sprite.set_texture(load("res://assets/chips.png"))
			sprite.set_texture(load("res://assets/coffee_cup.png"))
			sprite.set_texture(load("res://assets/drinking_glass.png"))
			sprite.set_texture(load("res://assets/greasy_pizza_box.png"))
			
		"Food":
			sprite.set_texture(load("res://assets/banana_peel.png"))
			sprite.set_texture(load("res://assets/bread.png"))
			
		"Plastic":
			sprite.set_texture(load("res://assets/spray_bottle.png"))
			sprite.set_texture(load("res://assets/milk_carton.png"))
			
		"Glass":
			sprite.set_texture(load("res://assets/glass_bottle.png"))
			
		"Metal":
			sprite.set_texture(load("res://assets/foil.png"))
			sprite.set_texture(load("res://assets/tin_can.png"))
			

func _process(delta):
	pass

func _physics_process(delta):
	print(global_transform.origin)
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
