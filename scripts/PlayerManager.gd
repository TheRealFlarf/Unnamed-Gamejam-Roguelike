extends Node3D

@onready var MAIN := $".."
@onready var PLAYER := $Player

@onready var playerState: String
@onready var combatState: String

@onready var playerVelocityQueue: Vector3
@onready var playerMaxSpeed := 5.0
@onready var acceleration: float = 2.0

func _ready() -> void:
	playerState = 'EXPLORE' # For debug purposes

func _physics_process(delta: float) -> void:
	control_process(delta)
	
	PLAYER.move_and_slide()






func get_player_state():
	# If playerState is an acceptable value, return it; 
	# Otherwise, return null.
	match playerState:
		'MENU', 'EXPLORE', 'COMBAT': return playerState
		_: return null

func check_player_state(input: String) -> bool:
	# Return a bool based on if the playerState matches the input.
	if input == get_player_state(): return true
	return false

func control_process(delta: float) -> void:
	if check_player_state('MENU'):
		return
	
	if check_player_state('EXPLORE'):
		if Input.is_action_pressed('move_up'):
			playerVelocityQueue += Vector3(0,0,-1)
			print('moving up!')
		if Input.is_action_pressed('move_down'):
			playerVelocityQueue += Vector3(0,0,1)
			print('moving down!')
		if Input.is_action_pressed('move_left'):
			playerVelocityQueue += Vector3(-1,0,1)
			print('moving left!')
		if Input.is_action_pressed('move_right'):
			playerVelocityQueue += Vector3(1,0,-1)
			print('moving right!')
	
	var lerpVel: Vector3 = lerp(PLAYER.velocity, playerVelocityQueue, acceleration)
	PLAYER.set_velocity(MAIN.cap_vec(lerpVel, MAIN.split_to_vec3(playerMaxSpeed)))
	
	if check_player_state('COMBAT'):
		return
