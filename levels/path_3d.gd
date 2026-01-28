extends Path3D

@export var enem : PackedScene = preload("res://enmy/enemy.tscn")
@onready var timer: Timer = $Timer
@export var diff_man : Node
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


func spawn_enemy() ->void:
	
	var gen = enem.instantiate()
	gen.maxhel = diff_man.get_health()
	add_child(gen)
	
	timer.wait_time = diff_man.get_spawn_time()


func _on_timer_timeout() -> void:
	spawn_enemy()
	
