extends Node2D

var engine_array : Array[Node] = []
var thrust_force_array : Array[Vector2] = []
var thrust_origin_array : Array[Vector2] = []

func _ready() -> void:
	engine_array = get_children()

func update_thrust() -> void:
	thrust_force_array.clear()
	thrust_origin_array.clear()
	for engine in engine_array:
		engine.update_thrust()
		thrust_force_array.append(engine.total_thrust_force)
		thrust_origin_array.append(engine.total_thrust_origin)

func enable_thrust(thruster_number: int = 0) -> void:
	if(thruster_number == 0):
		for engine in engine_array:
			engine.enable_thrust()
	else:
		engine_array[thruster_number-1].enable_thrust()

func disable_thrust(thruster_number: int = 0) -> void:
	if(thruster_number == 0):
		for engine in engine_array:
			engine.disable_thrust()
	else:
		engine_array[thruster_number-1].disable_thrust()

func thrust_up() -> void:
	for engine in engine_array:
		if(Vector2.from_angle(engine.rotation).angle_to(Vector2.UP) > deg_to_rad(100)):
			engine.enable_thrust()
		else:
			engine.disable_thrust()
