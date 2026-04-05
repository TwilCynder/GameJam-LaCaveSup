extends Node

@export var current_scale: float = 0;
@export var player_x: float = 0;
@export var absolute_time: float = 0;

func delta(delta: float): 
	return delta * current_scale;

func set_time(time: float):
	absolute_time += abs(time - player_x);
	player_x = time;
