extends RigidBody2D

var type: String

var isSelected: bool = false

func _ready():
	set_freeze_mode(FREEZE_MODE_STATIC)
	apply_impulse(Vector2(300,-1000))
	
func _process(delta):
	pass

func _physics_process(delta):
	if isSelected:
		global_transform.origin = get_global_mouse_position()
	
func _input_event(viewport, event, shape_idx):
	print("Input Received")
	if event is InputEventScreenTouch:
		if event.pressed:
			pickup()
		elif isSelected:
			drop(Input.get_last_mouse_velocity()*0.6)
	
func pickup():
	set_freeze_enabled(true)
	isSelected = true
	
func drop(impulse=Vector2.ZERO):
	set_freeze_enabled(false)
	apply_central_impulse(impulse)
	isSelected = false
