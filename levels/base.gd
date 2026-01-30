extends Node3D
class_name Base
@onready var label_3d: Label3D = $Label3D
@export var max_health: int = 5
var var_health : int :
	set(new_health):
		var_health = new_health
		label_3d.text = str(var_health) + "/" + str(max_health)
		if var_health <1:
			get_tree().reload_current_scene()


		var red : Color = Color.RED
		var white : Color = Color.WHITE

		label_3d.modulate=red.lerp(white,float(var_health)/float(max_health))

func take_damage()->void:
	var_health -=1
	




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var_health = max_health
	Engine.time_scale = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
