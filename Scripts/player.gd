extends CharacterBody2D
@export var SPEED = 400;
var time = TimeController;
const JUMP_VELOCITY = -400.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(time);
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	var direction = Vector2.ZERO;
	direction.x = (Input.get_action_strength("Right") - Input.get_action_strength("Left"));
	#direction.y = (Input.get_action_strength("Down") - Input.get_action_strength("Up"));
	
	velocity = direction * SPEED;
	
	move_and_slide();
	
	time.current_scale = velocity.normalized().x;
	time.player_x = position.x;
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass
