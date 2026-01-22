extends Area3D

@export var direction := Vector3.FORWARD

@export var speed := 30.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position += direction * speed * delta
	


func _on_timer_timeout() -> void:
	queue_free()
