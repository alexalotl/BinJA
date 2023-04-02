extends Node2D

@export var score_label: Label

var rubbish_types = ["Paper", "General", "Food", "Plastic", "Glass"]

var screen_height
var screen_width

var rng

var health: int = 3:
	set(value):
		health = value
		
var score: int = 0:
	set(value):
		score = value
		print("SCORE SET")
		score_label.text = "Score: " + str(value)

var _rubbish
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_height = 540
	screen_width = 1200
	rng = RandomNumberGenerator.new()
	_rubbish = load("res://scenes/rubbish.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_timer_timeout():
	var rubbish = _rubbish.instantiate()
	
	rubbish.type = rubbish_types[randi()%rubbish_types.size()]
	var spawn_y = rng.randi_range(screen_height/1.4, screen_height/2)
	print(spawn_y)
	var spawn_x
	var spawn_impulse_x
	if rng.randi() % 2:
		spawn_x = -100
		spawn_impulse_x = rng.randi_range(250, 800)
	else:
		spawn_x = screen_width + 100
		spawn_impulse_x = rng.randi_range(-800, -250)
	
	var spawn_impulse_y = -800
	
	rubbish.position = Vector2(spawn_x, spawn_y)
	add_child(rubbish)
	rubbish.apply_impulse(Vector2(spawn_impulse_x, spawn_impulse_y))
	
	pass # Replace with function body.

func _on_bin_failure():
	health -= 1
	
func _on_bin_success():
	score +=1
