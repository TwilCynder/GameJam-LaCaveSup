extends Area2D

class State:
	var position: Vector2
	var animation: String
	var frame: int;
	var playerPosition: float;
	
	func init(playerPosition_ : float, position_: Vector2, animation_: String, frame_: int):
		self.playerPosition = playerPosition_;
		self.position = position_;
		self.animation = animation_;
		self.frame_ = frame_;

@onready var sprite: AnimatedSprite2D = $Sprite;
var stateHistory: Array[State] = [];
var maxPlayerX = 0;
var current_index = 0;
		
func recordState(playerPosition: float):
	var state = State.new();
	state.init(playerPosition, self.position, sprite.animation, sprite.frame);
	
	stateHistory.push_back(state);
	current_index = stateHistory.size() - 1;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	delta = TimeController.delta(delta);
	if (TimeController.player_x > maxPlayerX): #record
		var currentState = stateHistory[current_index];
		var actual_fucking_delta = TimeController.player_x - currentState.playerPosition;
		
		var velocity = Vector2(400, 400) * delta;
		position += velocity;
		
		recordState(TimeController.player_x);
		maxPlayerX = TimeController.player_x;
	elif (delta < 0): #we're going back in time:
		var index = current_index;
		var state = stateHistory[current_index];
		while (true):
			var playerX = state.playerPosition;
			if (playerX <= TimeController.player_x): #found matching playerX
				break
			index -= 1;
			if (index) < 0: 
				print("EMERGENCY")
				break;
				pass #EMERGENCY
			state = stateHistory[index];
		current_index = index;
	
	elif (delta > 0): #we're going forward on already calculated path
		var index = current_index;
		var state = stateHistory[current_index];
		while (true):
			var playerX = state.playerPosition;
			if (playerX >= TimeController.player_x): #found matching playerX
				break
			index += 1;
			if (index) >= stateHistory.size(): 
				print("EMERGENCY")
				break;
				pass #EMERGENCY
			state = stateHistory[index];
		current_index = index;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
