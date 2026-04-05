extends Node

@export var player: Player;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func reset_():
	player = null;
	get_tree().reload_current_scene();

func reset_level():
	call_deferred("reset_")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
