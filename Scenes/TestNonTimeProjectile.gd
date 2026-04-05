extends NormalProjectile

const GRAVITY: float = 9.8
const TIME_MULT: float = 6.0

var initial_speed: float
var throw_angle_degrees: float
var throw_direction: Vector2
var initial_position: Vector2

func init_arc(direction: Vector2, desired_distance: float, desired_angle_deg: float) -> void:
	initial_position = position;
	throw_direction = direction.normalized()
	throw_angle_degrees = desired_angle_deg
	initial_speed = pow(desired_distance * GRAVITY / sin(2 * deg_to_rad(desired_angle_deg)), 0.5)

func calc_position(time: float):
	time = time * 10;
	
	var z_axis = initial_speed * sin(deg_to_rad(throw_angle_degrees)) * time \
		- 0.5 * GRAVITY * pow(time, 2)

	var x_axis: float = initial_speed * cos(deg_to_rad(throw_angle_degrees)) * time
	position = Vector2(
		initial_position.x + throw_direction.x * x_axis,
		initial_position.y - z_axis  # tout dans global_position, plus de position.y séparé
	)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
