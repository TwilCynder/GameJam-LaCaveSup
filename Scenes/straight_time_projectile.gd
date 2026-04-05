extends TimeBasedProjectile
class_name StraightTimeProjectile


@export var speed: float = 150.0        # pixels per second
@export var direction: Vector2 = Vector2(-1, 0)  # left by default

var _start_position: Vector2

func _ready() -> void:
	_start_position = position
	super._ready()

func calc_position(time: float) -> void:
	# time here is (player_x - spawn_time), i.e. elapsed "world time"
	position = _start_position + direction.normalized() * speed * time
