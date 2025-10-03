extends CanvasLayer

@onready var message_label: Label = $VBoxContainer/MessageLabel
@onready var start_button: Button = $VBoxContainer/StartButton
@onready var customise_button: Button = $VBoxContainer/CustomiseButton
@onready var exit_button: Button = $VBoxContainer/ExitButton
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	check_if_game_over()


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level_1.tscn")


func _on_customise_button_pressed() -> void:
	message_label.text = "Sorry, we havn't done that yet :("
	timer.start()


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_timer_timeout() -> void:
	check_if_game_over()
	
func check_if_game_over():
	if !GameManager.game_over:
		message_label.text = "Aqua Assets"
	else:
		message_label.text = "Game Over"
