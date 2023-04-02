extends Node2D

@export var score_label: Label
@export var health_container: Container

var rubbish_types = ["Paper", "General", "Food", "Plastic", "Glass", "Metal"]

var screen_height
var screen_width
var game
var rng
var spawn_timer

var health: int = 5:
	set(value):
		health = value
		health_container.get_child(value).queue_free()
		if health <= 0:
			get_tree().change_scene_to_file("res://scenes/game_over.tscn")
			
var score: int = 0:
	set(value):
		score = value
		print("SCORE SET")
		score_label.text = "Score: " + str(value)
		if score % 5 == 0:
			spawn_timer.wait_time -= 0.5
			if spawn_timer.wait_time < 1.0:
				spawn_timer.wait_time = 1.0
			

var _rubbish
# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_timer = get_node("Game/SpawnTimer")
	game = get_node("Game")
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
	var spawn_y = rng.randi_range(screen_height/2.4, screen_height/2)
	var spawn_x
	var spawn_impulse_x
	if rng.randi() % 2:
		spawn_x = -100
		spawn_impulse_x = rng.randi_range(250, 800)
	else:
		spawn_x = screen_width + 100
		spawn_impulse_x = rng.randi_range(-800, -250)
	
	var spawn_impulse_y = -600
	rubbish.position = Vector2(spawn_x, spawn_y)
	game.add_child(rubbish)
	rubbish.missed.connect(_on_rubbish_missed)
	rubbish.apply_impulse(Vector2(spawn_impulse_x, spawn_impulse_y))

func _on_rubbish_missed():
	health -= 1
	
func _on_bin_failure():
	health -= 1
	
func _on_bin_success():
	score +=1
