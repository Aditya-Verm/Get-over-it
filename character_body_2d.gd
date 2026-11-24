extends CharacterBody2D

const SPEED = 500.0
const JUMP_VELOCITY = -1500.0

var score: int = 0


@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Apply Gravity
	if not is_on_floor():
		velocity += get_gravity() * 2.5 * delta


	if Input.is_action_just_pressed("ui_accept") :
		velocity.y = JUMP_VELOCITY


	var direction := Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = direction * SPEED
		animated_sprite.flip_h = (direction < 0)
		animated_sprite.play("run") # Play running animation
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite.play("idle") # Play idle animation when stopped

	move_and_slide()


func add_bottle() -> void:
	score += 1
	print("Bottle collected! Score: ", score)
