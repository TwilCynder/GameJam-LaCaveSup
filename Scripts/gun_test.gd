extends CharacterBody2D
var bullet_path=preload("res://Scenes/bullet_test.tscn")

@export var fire_rate: float = 0.4  # secondes entre chaque tir

@onready var timer = $Timer


func _ready() -> void:
	timer.wait_time = fire_rate
	timer.timeout.connect(_on_fire)
	timer.start()


func _on_fire() -> void:
	var bullet = bullet_path.instantiate()
	bullet.dir = 0
	bullet.rota=global_rotation
	get_tree().root.add_child(bullet)
	bullet.global_position = $Node2D.global_position
