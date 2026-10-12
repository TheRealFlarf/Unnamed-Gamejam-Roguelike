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
		return
	
	if check_player_state('COMBAT'):
		return
