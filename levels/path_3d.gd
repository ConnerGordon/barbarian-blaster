extends Path3D

@export var enem : PackedScene = preload("res://enmy/enemy.tscn")
@onready var timer: Timer = $Timer
@export var diff_man : Node

@export var victory_layer : CanvasLayer


func spawn_enemy() ->void:
	
	var gen = enem.instantiate()
	gen.maxhel = diff_man.get_health()
	add_child(gen)
	gen.tree_exited.connect(enemy_defeated)
	timer.wait_time = diff_man.get_spawn_time()

func enemy_defeated() ->void:
	if timer.is_stopped():
		for child in get_children():
			if child is enemy:
				return
		victory_layer.victory()
		
func _on_timer_timeout() -> void:
	spawn_enemy()




func _on_difficultymanager_stopspawning() -> void:
	timer.stop()
