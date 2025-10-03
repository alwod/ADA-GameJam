extends CharacterBody2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var coyote_timer: Timer = $CoyoteTimer

var player_skin_1 = load("res://player/player_art.png")
var player_skin_2 = load("res://player/player_art_2.png")

var score = 0

var can_jump = false

const SPEED = 300.0
const JUMP_VELOCITY = -300.0

func _process(delta: float) -> void:
	if !GameManager.alternate_skin:
		sprite_2d.texture = player_skin_1
	else:
		sprite_2d.texture = player_skin_2
		
		
	if Input.is_action_just_pressed("move_left"):
		sprite_2d.flip_h = true
	if Input.is_action_just_pressed("move_right"):
		sprite_2d.flip_h = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and can_jump:
		jump()
		
	if !can_jump && is_on_floor():
		can_jump = true
		
	if Input.is_action_just_pressed("duck") and is_on_floor(): # Player is crouching / ducking
		pass
		
	if !is_on_floor() and can_jump and coyote_timer.is_stopped():
		coyote_timer.start()
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		
		if collision.get_collider().name == "CharacterBody2D":
			print("Collision with enemy")
			if !GameManager.game_over:
				GameManager.game_over = true
				#get_tree().change_scene_to_file("res://start_screen.tscn")
func jump():
	velocity.y = JUMP_VELOCITY
	can_jump = false


func _on_coyote_timer_timeout() -> void:
	can_jump = false
