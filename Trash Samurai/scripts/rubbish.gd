extends RigidBody2D

var type: String

var isSelected: bool = false:
	set(value):
		if value:
			set_freeze_enabled(true)
		else:
			set_freeze_enabled(false)
			apply_central_impulse(Vector2(0,0))

func _ready():
	apply_impulse(Vector2(1000,-1000))
	
func _process(delta):
	print(linear_velocity)

func _physics_process(delta):
	if isSelected:
		global_transform.origin = get_global_mouse_position()
		
func _input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch:
		if event.pressed:
			apply_impulse(Vector2(-1000,-1000))
			isSelected = true

