extends PathFollow3D
class_name enemy
## speed of the enemy. what else?
@export var speed:= 10.0
@export var maxhel:= 50


@onready var animation_player: AnimationPlayer = $AnimationPlayer


var health: int:
	set(nhealth):
		if health > nhealth:
			animation_player.play("take_damage")
		health = nhealth
		
		if health <1:
			queue_free()

@onready var base : Base = get_tree().get_first_node_in_group("base")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = maxhel
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	progress += delta* speed
	
	if progress_ratio > 0.990:
		base.take_damage()
		queue_free()


func tkdmg()->void:
	health -=30
