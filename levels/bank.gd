extends MarginContainer
@onready var label: Label = $Label

@export var starting_gold := 150

var gold : int:
	set(ngold):
		
		gold = max(0,ngold)
		
		
		label.text = "Gold: "+ str(gold)
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gold = starting_gold


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
