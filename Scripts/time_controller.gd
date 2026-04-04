extends Node

@export var current_scale = 0;

func delta(delta: float): 
	return delta * current_scale;
