extends CharacterBody2D

@onready var player = get_tree().get_first_node_in_group("Player")
@export var movement_speed = 50.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	if not player:
		return
		
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * movement_speed
	move_and_slide()
