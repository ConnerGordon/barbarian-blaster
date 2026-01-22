extends Node3D
@export var proj = preload("res://projectiles/projectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var inst = proj.instantiate()
	inst.position = position + Vector3(0,1,0)
	inst.direction = Vector3(cos(rotation.x),0,sin(rotation.z))
	add_child(inst)
	
