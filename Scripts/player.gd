extends Node2D

@export var SPEED = 400;
var time = TimeController;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(time);
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Vector2.ZERO;
	direction.x = (Input.get_action_strength("Right") - Input.get_action_strength("Left"));
	direction.y = (Input.get_action_strength("Down") - Input.get_action_strength("Up"));

	time.current_scale = direction.x;

	self.position += direction * SPEED * delta;
	
	pass
