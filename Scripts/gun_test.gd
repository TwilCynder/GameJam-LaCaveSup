extends CharacterBody2D

@export var BULLET_INTERVAL = 0.4;
@export var SIZE = 12;

@onready var anchorNode = $Anchor;
var bulletScene = preload("res://Scenes/TestArcProjectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for t in range(0, SIZE):
		#print(t * BULLET_INTERVAL)
		var inst: ArcBullet = bulletScene.instantiate()
		inst.spawn_time = t * BULLET_INTERVAL;
		inst.position = anchorNode.position;
		add_child(inst);
		inst.init_arc(Vector2(-1, 0), 150.0, 60.0);
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass
