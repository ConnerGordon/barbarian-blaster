extends Node

@onready var timer: Timer = $Timer
@export var spawn_time_curve : Curve
@export var game_length := 30.0
@export var health_time_curve : Curve

signal stopspawning()

func _ready() -> void:
	timer.start(game_length)
	
	
func _process(delta: float) -> void:
	pass

func game_progress_ratio() -> float:
	return 1.0-timer.time_left / game_length


func get_spawn_time()-> float:
	return spawn_time_curve.sample(game_progress_ratio())


func get_health()-> float:
	return health_time_curve.sample(game_progress_ratio())


func _on_timer_timeout() -> void:
	stopspawning.emit()
