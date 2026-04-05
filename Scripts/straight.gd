extends CharacterBody2D

@export var BULLET_INTERVAL = 1.2;
@export var SIZE = 12;

@onready var anchorNode = $Anchor;
var bulletScene = preload("res://Scenes/StraightTimeProjectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for t in range(0, SIZE):
		#print(t * BULLET_INTERVAL)
		var inst: StraightTimeProjectile = bulletScene.instantiate()
		inst.spawn_time = t * BULLET_INTERVAL;
		inst.position = anchorNode.position;
		add_child(inst);
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass
