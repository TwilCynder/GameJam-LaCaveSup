extends CharacterBody2D
class_name Player

@export var MAX_SPEED = 10170
@export var GRAVITY = 2750.5
@export var JUMP_POWER = 4000

enum { MOVE, JUMP, DEAD }
@onready var fade = $CanvasLayer/ColorRect
@onready var sprite = $AnimatedSprite2D
@onready var jump_timer = $JumpTimer
@onready var death_sound = $DeathSound
var last_direction = 1
var state = MOVE
var jumping = false

var init_pos_x: float;

func _ready() -> void:
	init_pos_x = position.x;
	LevelController.player = self;

func _physics_process(delta):

	velocity.y += GRAVITY * delta
	if state == DEAD :
		return
		
	if Input.is_action_just_pressed("ui_cancel"):
		macron_explosion()
		return
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
	TimeController.set_time((position.x - init_pos_x) / 200)
	TimeController.current_scale = velocity.normalized().x;

func end_game_over():
	LevelController.reset_level();

func fade_to_black():
	var tween = create_tween()
	tween.tween_property(fade, "color:a", 1.0, 1.5)
	tween.tween_callback(end_game_over)
	
func macron_explosion():
	state = DEAD
	velocity = Vector2.ZERO
	set_physics_process(false)
	sprite.play("death")
	death_sound.play()
	fade_to_black()
	
func jump_state(delta):
	# horizontal movement in the air
	var input_x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	if input_x != 0:
		last_direction = input_x
		velocity.x = input_x * MAX_SPEED * delta
		sprite.flip_h = input_x < 0
	else:
		velocity.x = 0

	if jumping:
		velocity.y -= JUMP_POWER * delta
	elif is_on_floor():
		state = MOVE
		velocity.x = 0
		sprite.play("idle")

func move_state(delta):
	var input_x = Input.get_action_strength("Right") - Input.get_action_strength("Left")

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
