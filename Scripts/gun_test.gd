extends CharacterBody2D

var bullet_path = preload("res://Scenes/bullet_test2.tscn")

@export var fire_rate: float = 0.4
@export var desired_distance: float = 150.0
@export var desired_angle_deg: float = 60.0
@export var throw_direction: Vector2 = Vector2(-1, 0)  # tire à gauche par défaut

@onready var timer = $Timer


func _ready() -> void:
	timer.wait_time = fire_rate
	timer.timeout.connect(_on_fire)
	timer.start()


func _on_fire() -> void:
	var bullet = bullet_path.instantiate()
	get_tree().root.add_child(bullet)
	bullet.launch($Node2D.global_position, throw_direction, desired_distance, desired_angle_deg)
