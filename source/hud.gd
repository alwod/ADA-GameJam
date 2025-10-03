extends CanvasLayer
@onready var score_label: Label = $ScoreLabel
@onready var game_over_label: Label = $GameOver


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game_over_label.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	score_label.text = str(GameManager.coins)
	if (GameManager.game_over):
		game_over_label.visible = true 
