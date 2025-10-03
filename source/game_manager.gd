extends Node

var coins = 0;
var game_over = false
var game_win = false

var alternate_skin = false

var test = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (game_over or game_win) and test:
		test = false
		get_tree().change_scene_to_file("res://start_screen.tscn")
	
func reset():
	coins = 0
	game_over = false
	game_win = false
