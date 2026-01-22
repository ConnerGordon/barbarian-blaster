extends Node3D
class_name TurretManager

@export var turret : PackedScene



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func build_turret(pos:Vector3)->void:
	var atur = turret.instantiate()
	add_child(atur)
	atur.global_position = pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
