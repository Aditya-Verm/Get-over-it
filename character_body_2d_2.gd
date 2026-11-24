extends CharacterBody2D

const SPEED = 500.0
const JUMP_VELOCITY = -700.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * 2.5 * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction > 0:
		velocity.x = direction * SPEED
		animated_sprite.play("walk right")
	elif direction < 0:
		velocity.x = direction * SPEED
		animated_sprite.play("walk left")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite.stop()

	move_and_slide()
