extends Node

@export var current_scale: float = 0;
@export var player_x: float = 0;


func delta(delta: float): 
	return delta * current_scale;
