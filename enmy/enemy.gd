extends PathFollow3D
class_name enemy
## speed of the enemy. what else?
@export var speed:= 10.0
@export var maxhel:= 50

@export var defgold := 25 + randf_range(0,15)
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var bank = get_tree().get_first_node_in_group("goonbank")

@export var diff_man : Node
@export var chance : float = 15

var health: int:
	set(nhealth):
		if health > nhealth:
			animation_player.play("take_damage")
		health = nhealth
		
		if health <1:
			bank.gold += defgold
			queue_free()

@onready var base : Base = get_tree().get_first_node_in_group("base")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = maxhel
	var bosschance = randf()
	if bosschance < chance/100:
		health += 31
		print("boss")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	progress += delta* speed
	
	if progress_ratio > 0.990:
		base.take_damage()
		queue_free()


func tkdmg()->void:
	health -=30
