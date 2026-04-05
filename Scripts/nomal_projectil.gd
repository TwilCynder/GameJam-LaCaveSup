extends Projectile
class_name NormalProjectile

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func calc_position(time: float):
	pass

func _physics_process(delta: float) -> void:
	var time = TimeController.absolute_time
	if (time <= spawn_time):
		hide();
		return;
	else: 
		show();
	
	time = time - spawn_time;
	
	calc_position(time);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
