extends RigidBody2D

@export_enum("Paper", "General", "Food", "Plastic", "Glass") var type: String

var isSelected: bool = false
	
func _ready():
	set_freeze_mode(FREEZE_MODE_STATIC)
	var sprite = get_node("Sprite")
	match type:
		"Paper":
			sprite.set_texture(load("res://assets/paper.png"))
			
		"General":
			sprite.set_texture(load("res://assets/foil.png"))
			
		"Food":
			sprite.set_texture(load("res://assets/banana_peel.png"))
			
		"Plastic":
			sprite.set_texture(load("res://assets/cup.png"))
			
		"Glass":
			sprite.set_texture(load("res://assets/cup.png"))

func _process(delta):
	pass

func _physics_process(delta):
	if isSelected:
		global_transform.origin = get_global_mouse_position()
	
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
