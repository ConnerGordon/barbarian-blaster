extends Camera3D

@export var gridmap : GridMap
@export var turret_manager : TurretManager
@onready var ray_cast_3d: RayCast3D = $RayCast3D

@onready var bank := get_tree().get_first_node_in_group("goonbank")


@export_enum("ez","mid","hard") var difficulty := "mid"
var tower_dict = {"ez":50,"mid":100, "hard":150}
var tower_cost : int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tower_cost = tower_dict[difficulty]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse_pos : Vector2 = get_viewport().get_mouse_position()
	
	ray_cast_3d.target_position = project_local_ray_normal(mouse_pos)*100
	ray_cast_3d.force_raycast_update()
	
	##printt(ray_cast_3d.get_collider(), ray_cast_3d.get_collision_point())
	if ray_cast_3d.is_colliding() and bank.gold >= tower_cost:
		var collider = ray_cast_3d.get_collider()
		if collider is GridMap:
			var collision_point = ray_cast_3d.get_collision_point()
			var cell = gridmap.local_to_map(collision_point)
			if gridmap.get_cell_item(cell) == 0:
				Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
				if Input.is_action_just_pressed("click"):
					bank.gold -=100
					gridmap.set_cell_item(cell,1)
					var tilpos = gridmap.map_to_local(cell)
					turret_manager.build_turret(tilpos)
			else:
				Input.set_default_cursor_shape(Input.CURSOR_ARROW)
		else:
			Input.set_default_cursor_shape(Input.CURSOR_ARROW)
