extends Area2D

var SPEED = 400;
var time = TimeController;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	delta = delta * time.current_scale;
	print(time.current_scale)
	
	var velocity = Vector2(-SPEED, 0);
	
	position += velocity * delta;
	
	pass
