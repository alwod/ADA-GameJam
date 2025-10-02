extends Area2D

signal hit

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("duck"):
		velocity.y += 1
	if Input.is_action_pressed("jump"):
		velocity.y -= 1

	if velocity.length() > 0: # Run this if the player is moving
		velocity = velocity.normalized() * speed
	else: # Run this if the player is not moving
		pass
		
	# Change the player's position
	position += velocity * delta
	# Stop the player from going off-screen
	position = position.clamp(Vector2.ZERO, screen_size)


func _on_body_entered(_body: Node2D) -> void:
	hit.emit()
