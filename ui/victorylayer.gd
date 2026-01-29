extends CanvasLayer

@onready var star_2: TextureRect = %star2
@onready var star_3: TextureRect = %star3
@onready var base := get_tree().get_first_node_in_group("base")
@onready var bank := get_tree().get_first_node_in_group("goonbank")



@onready var health_label: Label = %healthLabel
@onready var g: Label = %g


func _on_retry_pressed() -> void:
	get_tree().reload_current_scene()


func _on_quit_pressed() -> void:
	get_tree().quit()



func victory()->void:
	visible = true
	if base.var_health == base.max_health:
		star_2.modulate = Color.WHITE
		health_label.visible = true
	if bank.gold >= 500:
		star_3.modulate = Color.WHITE
		g.visible = true
