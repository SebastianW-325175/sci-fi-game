extends Node2D
## Script that manages all the engines on a ship.

## Handy array of references to all the engine nodes on the ship.
var engines : Array[Node] = []

## Here, the program just grabs all the children and adds them to the engines array.[br]
## For future reference: This assumes that all the children of this node are engines.
func _ready() -> void:
	engines = get_children()

## Utility function which returns an array of all the engines active at the moment.
func get_active_engines() -> Array[Node]:
	# Prepare the array
	var active_engines : Array[Node] = []
	# Using the engines array, iteratively check the engines and add them
	for engine in engines:
		if engine.is_active or engine.is_overriden:
			active_engines.append(engine)
	# Finally, return the resulting array
	return active_engines

## This function fulfills the role of the automatic steering model.
## It uses a heading, spin and rotation vector passed in the arguments to manage
## the state of each engine.
func update_engines(heading : Vector2, spin : int, rotation: float) -> void:
	# If the there is no heading and spin, turn off all engines.
	if heading == Vector2.ZERO and spin == 0:
		disable_thrust()
	# If there is a heading or spin, iterate over each engine and manage them in such a
	# way, as to achieve a propulsion in the general direction of the heading or
	# a rotation matching the spin.
	else:
		for engine in engines:
			# Local heading is the direction in which the ship is instructed
			# to move in, in coordinates local to the ship, hence the negation.
			var local_heading : Vector2 = heading.rotated(-rotation)
			# Get the direction of the engine's propulsion.
			var engine_heading : Vector2 = Vector2.from_angle(engine.rotation)
			# If the engine can provide thrust in that direction (The angle
			# between the two aformentioned vectors is larger than 120 degrees)
			# then turn on that engine.
			# Additionally, if running the engine can rotate the ship in the
			# direction indicated by spin, also turn on that engine.
			if(
				(
					heading != Vector2.ZERO and
					abs(engine_heading.angle_to(local_heading)) > deg_to_rad(120)
				) or 
				int(engine.position.cross(engine_heading) * spin) > 0
			):
				engine.enable_thrust()
			# If it can't provide the necessary propulsion, disable it.
			else:
				engine.disable_thrust()
			
			if(int(engine.position.cross(engine_heading) * spin) > 0):
				engine.enable_thrust()

## Utility method, which assists in managing the state of engines.
func enable_thrust(thruster_number: int = 0) -> void:
	if(thruster_number == 0):
		for engine in engines:
			engine.enable_thrust()
	else:
		engines[thruster_number-1].enable_thrust()
## Utility method, which assist in managing the state of engines.
func disable_thrust(thruster_number: int = 0) -> void:
	if(thruster_number == 0):
		for engine in engines:
			engine.disable_thrust()
	else:
		engines[thruster_number-1].disable_thrust()

## Utility method, which assists in managing the overriding of engines.
func enable_thrust_override(thruster_number: int = 0) -> void:
	if(thruster_number == 0):
		for engine in engines:
			engine.enable_thrust_override()
	else:
		engines[thruster_number-1].enable_thrust_override()
## Utility method, which assists in managing the overriding of engines.
func disable_thrust_override(thruster_number: int = 0) -> void:
	if(thruster_number == 0):
		for engine in engines:
			engine.disable_thrust_override()
	else:
		engines[thruster_number-1].disable_thrust_override()
