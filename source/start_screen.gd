extends CanvasLayer

@onready var message_label: Label = $VBoxContainer/MessageLabel
@onready var start_button: Button = $VBoxContainer/StartButton
@onready var customise_button: Button = $VBoxContainer/CustomiseButton
@onready var exit_button: Button = $VBoxContainer/ExitButton
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	check_game_status()


func _on_start_button_pressed() -> void:
	GameManager.reset()
	GameManager.test = true
	get_tree().change_scene_to_file("res://levels/level_1.tscn")


func _on_customise_button_pressed() -> void:
	if GameManager.alternate_skin:
		message_label.text = "You will play as orange fish!"
	else:
		message_label.text = "You will play as red fish!"
	timer.start()
	GameManager.alternate_skin = !GameManager.alternate_skin


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_timer_timeout() -> void:
	check_game_status()
	
func check_game_status():
	if GameManager.game_over:
		message_label.text = "Game Over"
	elif GameManager.game_win:
		if GameManager.coins == 13:
			message_label.text = "You got all 13 coins!"
		else:
			message_label.text = "You won! Score: " + str(GameManager.coins)
	else:
		message_label.text = "Aqua Assets"
