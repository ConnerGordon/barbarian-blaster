extends Area3D

@export var direction := Vector3.FORWARD

@export var speed := 60.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position += direction * speed * delta
	


func _on_timer_timeout() -> void:
	queue_free()
	


func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("enemy_area"):
		area.get_parent().health -=30
		queue_free()
