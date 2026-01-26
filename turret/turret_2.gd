extends Node3D
@export var proj = preload("res://projectiles/projectile.tscn")
@onready var enpath : Path3D 
var target : Node3D


@onready var cannon: MeshInstance3D = $turret_base/cannon


@export var turrng := 10.0


@onready var animation_player: AnimationPlayer = $AnimationPlayer




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func fbt()->enemy:
	var tag = null
	var tagprog = 0
	
	for en in enpath.get_children():
		if en is enemy:
			if en.progress > tagprog:
				var distance = global_position.distance_to(en.global_position)
				if distance <= turrng:
					tag = en
					tagprog = en.progress
	
	
	
	return tag


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	target = fbt()
	if target != null:
		look_at(target.global_position, Vector3.UP,true)
		
		


func _on_timer_timeout() -> void:
	if target != null:
		animation_player.play("fire")
		var inst = proj.instantiate()
		add_child(inst)
		inst.position = position + Vector3(0,1,0)
		
		inst.direction = global_transform.basis.z
	
