extends CharacterBody2D

var bullet_path = preload("res://Scenes/TestArcProjectile2.tscn")

@export var fire_rate: float = 0.4
@export var desired_distance: float = 150.0
@export var desired_angle_deg: float = 60.0
@export var throw_direction: Vector2 = Vector2(-1, 0)  # tire à gauche par défaut

@onready var timer = $Timer

@export var INTERVAL = 0.5;
var last_fire_time = 0;

@onready var anchorNode = $Anchor;

func _physics_process(delta: float) -> void:
	var time = TimeController.absolute_time;
	
	if (time - last_fire_time > INTERVAL):
		last_fire_time = time;
		var inst = bullet_path.instantiate();
		inst.position = anchorNode.position;
		inst.spawn_time = time;
		add_child(inst);
		inst.init_arc(throw_direction, desired_distance, desired_angle_deg);
		
		pass
	
