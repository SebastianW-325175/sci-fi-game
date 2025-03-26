extends Node2D

var engines : Array[Node] = []

func _ready() -> void:
	engines = get_children()

func get_active_engines() -> Array[Node]:
	var active_engines : Array[Node] = []
	for engine in engines:
		if engine.is_active or engine.is_overriden:
			active_engines.append(engine)
	return active_engines

func update_engines(heading : Vector2, rotation: float) -> void:
	if heading == Vector2.ZERO:
		disable_thrust()
	else:
		for engine in engines:
			var local_heading : Vector2 = heading.rotated(-rotation)
			var engine_heading : Vector2 = Vector2.from_angle(engine.rotation)
			if engine == $Engine1:
				print(abs(rad_to_deg(engine_heading.angle_to(local_heading))))
			if(abs(engine_heading.angle_to(local_heading)) > deg_to_rad(120)):
				engine.enable_thrust()
			else:
				engine.disable_thrust()

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

func enable_thrust_override(thruster_number: int = 0) -> void:
	if(thruster_number == 0):
		for engine in engines:
			engine.enable_thrust_override()
	else:
		engines[thruster_number-1].enable_thrust_override()
		
func disable_thrust_override(thruster_number: int = 0) -> void:
	if(thruster_number == 0):
		for engine in engines:
			engine.disable_thrust_override()
	else:
		engines[thruster_number-1].disable_thrust_override()
