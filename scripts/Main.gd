extends Node3D

@onready var PLAYMAN := $PlayerManager
@onready var PLAYER := $PlayerManager/Player

@onready var MAPMAN := $MapManager

@onready var CAMMAN := $CameraManager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame,
# with limitations that may make it inconsistent.
func _process(delta: float) -> void:
	pass



func is_between(minimum: float, input: float, maximum: float) -> bool:
	if input < maximum && input > minimum:
		return true
	return false

func cap_vec(input: Vector3, cap: Vector3) -> Vector3:
	var output = input
	var capabs: Vector3 = abs(cap)
	if input.x > capabs.x:
		output.x = capabs.x
	if input.x < -capabs.x:
		output.x = -capabs.x
	
	if input.y > capabs.y:
		output.y = capabs.y
	if input.y < -capabs.y:
		output.y = -capabs.y
	
	if input.z > capabs.z:
		output.z = capabs.z
	if input.z < -capabs.z:
		output.z = -capabs.z
	
	return output

func split_to_vec3(input: float) -> Vector3:
	return Vector3(input, input, input)
