extends Area2D
class_name Projectile

@export var spawn_time: float = 0;

@onready var sprite: AnimatedSprite2D = $Sprite;
var spriteFPS: float;
var spriteFrames: int;

func on_body_entered():
	pass
	
func _on_body_entered(body):
	if on_body_entered():
		return
	if body is Player:
		body.macron_explosion()
	
# Called when the node enters the scene tree for the first time.
func init_projectile() -> void:
	spriteFPS = sprite.sprite_frames.get_animation_speed("default");
	spriteFrames = sprite.sprite_frames.get_frame_count("default");
	sprite.stop();
	body_entered.connect(self._on_body_entered)
	pass # Replace with function body.

func update_animation(time: float):
	sprite.frame = (floor(time * spriteFPS) as int) % spriteFrames;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
