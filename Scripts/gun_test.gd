extends CharacterBody2D

var BULLET_INTERVAL = 200;
var SIZE = 2000;

@onready var anchorNode = $Anchor;
var bulletScene = preload("res://Scenes/TestArcProjectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var bullet: ArcBullet = $Bullet;
	bullet.init_arc(Vector2(-1, 0), 150.0, 60.0);
	
	for t in range(0, SIZE, BULLET_INTERVAL):
		var inst: ArcBullet = bulletScene.instantiate()
		inst.spawn_time = t;
		add_child(inst);
		inst.position = anchorNode.position;
		inst.init_arc(Vector2(-1, 0), 150.0, 60.0);
		print(inst.position);
		
		
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass
