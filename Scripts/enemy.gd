extends Area2D

var SPEED = 400;
var time = TimeController;
@onready var animation = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	delta = time.delta(delta);
	
	var velocity = Vector2(-SPEED, 0);
	position += velocity * delta;
	
	pass
