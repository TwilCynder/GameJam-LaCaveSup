extends Area2D

var SPEED = 400;
var time = TimeController;
@onready var animation = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	delta = time.delta(delta);
	
	var velocity = Vector2(-SPEED / 2, SPEED / 2);
	position += velocity * delta;
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
