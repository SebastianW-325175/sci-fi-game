extends Node2D

var engines : Array[Node] = []

func _ready() -> void:
	engines = get_children()

func get_active_engines() -> Array[Node]:
	var active_engines : Array[Node] = []
	for engine in engines:
		if engine.is_active:
			active_engines.append(engine)
	return active_engines

func enable_thrust(thruster_number: int = 0) -> void:
	if(thruster_number == 0):
		for engine in engines:
			engine.enable_thrust()
	else:
		engines[thruster_number-1].enable_thrust()

func disable_thrust(thruster_number: int = 0) -> void:
	if(thruster_number == 0):
		for engine in engines:
			engine.disable_thrust()
	else:
		engines[thruster_number-1].disable_thrust()

func thrust_up() -> void:
	for engine in engines:
		if(Vector2.from_angle(engine.rotation).angle_to(Vector2.UP) > deg_to_rad(100)):
			engine.enable_thrust()
		else:
			engine.disable_thrust()
