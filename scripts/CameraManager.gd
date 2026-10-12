extends Node3D

@onready var CAMERA := $Camera3D
@onready var PLAYER := $"../PlayerManager/Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	CAMERA.set_position(PLAYER.position + Vector3(5,5,5))
	CAMERA.set_rotation_degrees(Vector3(-45,45,0))
