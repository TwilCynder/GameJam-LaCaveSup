extends Projectile
class_name TimeBasedProjectile

class State:
	var position: Vector2
	var animation: String
	var frame: int;
	var playerPosition: float;
	
	func init(playerPosition_ : float, position_: Vector2):
		self.playerPosition = playerPosition_;
		self.position = position_;

@export var spawn_time: float = 0;
var destruction_time: float = 0;

var stateHistory: Array[State] = [];
var maxPlayerX = 0;
var current_index = 0;
		
func recordState(playerPosition: float):
	var state = State.new();
	state.init(playerPosition, self.position);
	
	stateHistory.push_back(state);
	current_index = stateHistory.size() - 1;

func calc_position(time: float):
	pass

func _physics_process(delta: float) -> void:
	delta = TimeController.delta(delta);

	var time = TimeController.player_x;
	if (time <= spawn_time):
		hide();
		return;
	else: 
		show();
	
	time = time - spawn_time;
	
	if (time > maxPlayerX): #record
		print("RECORD")
		var currentState = stateHistory[current_index];
		var actual_fucking_delta = TimeController.player_x - currentState.playerPosition;
		
		calc_position(time);
		
		recordState(time);
		maxPlayerX = time;
	elif (delta != 0): #we're going back in time:
		var index = current_index;
		var state = stateHistory[current_index];
		if (delta < 0):
			print("BACKWARD")
			while (true):
				var playerX = state.playerPosition;
				if (playerX <= time): #found matching playerX
					break
				index -= 1;
				if (index) < 0: 
					print("EMERGENCY")
					break;
					pass #EMERGENCY
				state = stateHistory[index];
		elif (delta > 0): #we're going forward on already calculated path
			print("FORWARD")
			while (true):
				var playerX = state.playerPosition;
				if (playerX >= time): #found matching playerX
					break
				index += 1;
				if (index) >= stateHistory.size(): 
					print("EMERGENCY")
					break;
					pass #EMERGENCY
				state = stateHistory[index];
		
		current_index = index;
		position = state.position;
	
func on_body_entered():
	pass
	
func _on_body_entered(body):
	if on_body_entered():
		return
	if body is Player:
		body.macron_explosion()
	
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (spawn_time > 0):
		hide();
	recordState(0);
	monitoring = true
	body_entered.connect(self._on_body_entered)

	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
