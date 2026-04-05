extends CharacterBody2D
class_name Player

@export var MAX_SPEED = 10170
@export var GRAVITY = 2750.5
@export var JUMP_POWER = 5100

enum { MOVE, JUMP }

@onready var sprite = $AnimatedSprite2D
@onready var jump_timer = $JumpTimer

var last_direction = 1
var state = MOVE
var jumping = false

func _physics_process(delta):
	velocity.y += GRAVITY * delta

	if Input.is_action_just_pressed("Jump") && is_on_floor() && state != JUMP:
		state = JUMP
		jumping = true
		jump_timer.start()
		sprite.play("jump")

	match state:
		MOVE:
			move_state(delta)
		JUMP:
			jump_state(delta)

	move_and_slide()

func jump_state(delta):
	if jumping:
		velocity.y -= JUMP_POWER * delta
	elif is_on_floor():
		state = MOVE
		velocity.x = 0
		sprite.play("idle")

func move_state(delta):
	var input_x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")

	if input_x != 0:
		last_direction = input_x
		velocity.x = input_x * MAX_SPEED * delta
		sprite.flip_h = input_x < 0
		sprite.play("run")
	else:
		velocity.x = 0
		sprite.play("idle")

func _on_JumpTimer_timeout():
	jumping = false
