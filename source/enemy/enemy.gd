extends CharacterBody2D

@onready var player = get_tree().get_first_node_in_group("Player")
@export var movement_speed = 170.0
@onready var sprite_2d: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	if not player:
		return
		
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * movement_speed
	
	if velocity.x >= 1:
		sprite_2d.flip_h = false
	if velocity.x <= -1:
		sprite_2d.flip_h = true
	
	move_and_slide()
