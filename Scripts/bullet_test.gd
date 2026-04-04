extends Node2D

const GRAVITY: float = 9.8
const TIME_MULT: float = 6.0

var initial_speed: float
var throw_angle_degrees: float
var throw_direction: Vector2
var initial_position: Vector2

var time: float = 0.0
var z_axis: float = 0.0
var is_launched: bool = false

@onready var projectile_sprite = $Sprite2D


func launch(spawn_pos: Vector2, direction: Vector2, desired_distance: float, desired_angle_deg: float) -> void:
	initial_position = spawn_pos
	throw_direction = direction.normalized()
	throw_angle_degrees = desired_angle_deg
	initial_speed = pow(desired_distance * GRAVITY / sin(2 * deg_to_rad(desired_angle_deg)), 0.5)

	global_position = initial_position
	time = 0.0
	z_axis = 0.0
	is_launched = true

func _process(delta: float) -> void:
	if not is_launched:
		return

	time += delta * TIME_MULT

	z_axis = initial_speed * sin(deg_to_rad(throw_angle_degrees)) * time \
		- 0.5 * GRAVITY * pow(time, 2)

	var x_axis: float = initial_speed * cos(deg_to_rad(throw_angle_degrees)) * time

	global_position = Vector2(
		initial_position.x + throw_direction.x * x_axis,
		initial_position.y - z_axis  # tout dans global_position, plus de position.y séparé
	)
