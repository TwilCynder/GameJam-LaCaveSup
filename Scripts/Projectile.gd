extends Area2D
class_name Projectile

@onready var sprite: AnimatedSprite2D = $Sprite;
var spriteFPS: float;
var spriteFrames: int;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spriteFPS = sprite.sprite_frames.get_animation_speed("default");
	spriteFrames = sprite.sprite_frames.get_frame_count("default");
	sprite.stop();
	pass # Replace with function body.

func update_animation(time: float):
	sprite.frame = (floor(time * spriteFPS) as int) % spriteFrames;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
