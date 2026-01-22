extends Node3D
@export var proj = preload("res://projectiles/projectile.tscn")
@onready var enpath : Path3D 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var enemy = enpath.get_children().back()
	look_at(enemy.global_position, Vector3.UP,true)


func _on_timer_timeout() -> void:
	var inst = proj.instantiate()
	inst.position = position + Vector3(0,1,0)
	##inst.direction = Vector3(cos(rotation.x),0,sin(rotation.z))
	add_child(inst)
	
