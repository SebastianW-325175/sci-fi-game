extends RigidBody2D
## Ship controller script designed for the Kairos

## Decides whether the ship should respond to controls
var is_controlled := false
## Heading of the automatic steering
var heading : Vector2 = Vector2.ZERO
## Spin of the automatic steering
var spin : int = 0;

## The function that runs every time a physics frame is calculated.
## Right now, this function is also used to do calculations on the engines
## and actually handles turning the engines on and off (this is bad)
func _physics_process(delta) -> void:
	# First, update the automatic steering heading and spin
	update_steering()
	# Based on the heading, spin and rotation of the ship, turn on specific engines
	$EngineHandler.update_engines(heading, spin, rotation)
	# Get references to all the active engine nodes
	var active_engines : Array[Node] = $EngineHandler.get_active_engines()
	# For every active engine, get it's force and origin and apply it to the ship
	for engine in active_engines:
		var force : Vector2 = engine.force.rotated(rotation)
		var origin : Vector2 = engine.position.rotated(rotation)
		apply_force(force, origin)

## Input handling of manual engine controls and camera zoom [br]
## BUG: Manual engine control doesn't work
func _input(event) -> void:
	if is_controlled:
		if event.is_action_pressed("ship_engine_all"):
			$EngineHandler.enable_thrust_override()
		elif event.is_action_released("ship_engine_all"):
			$EngineHandler.disable_thrust_override()
		elif event.is_action_pressed("ship_engine_1"):
			$EngineHandler.enable_thrust_override(1)
		elif event.is_action_released("ship_engine_1"):
			$EngineHandler.disable_thrust_override(1)
		elif event.is_action_pressed("ship_engine_2"):
			$EngineHandler.enable_thrust_override(2)
		elif event.is_action_released("ship_engine_2"):
			$EngineHandler.disable_thrust_override(2)
		elif event.is_action_pressed("ship_engine_3"):
			$EngineHandler.enable_thrust_override(3)
		elif event.is_action_released("ship_engine_3"):
			$EngineHandler.disable_thrust_override(3)
		elif event.is_action_pressed("ship_engine_4"):
			$EngineHandler.enable_thrust_override(4)
		elif event.is_action_released("ship_engine_4"):
			$EngineHandler.disable_thrust_override(4)
		elif event.is_action_pressed("ship_engine_5"):
			$EngineHandler.enable_thrust_override(5)
		elif event.is_action_released("ship_engine_5"):
			$EngineHandler.disable_thrust_override(5)
		elif event.is_action_pressed("ship_engine_6"):
			$EngineHandler.enable_thrust_override(6)
		elif event.is_action_released("ship_engine_6"):
			$EngineHandler.disable_thrust_override(6)
		elif event.is_action_pressed("ship_engine_7"):
			$EngineHandler.enable_thrust_override(7)
		elif event.is_action_released("ship_engine_7"):
			$EngineHandler.disable_thrust_override(7)
		elif event.is_action_pressed("ship_engine_8"):
			$EngineHandler.enable_thrust_override(8)
		elif event.is_action_released("ship_engine_8"):
			$EngineHandler.disable_thrust_override(8)
		elif event.is_action_pressed("ship_engine_9"):
			$EngineHandler.enable_thrust_override(9)
		elif event.is_action_released("ship_engine_9"):
			$EngineHandler.disable_thrust_override(9)
		elif event.is_action_pressed("zoom_in"):
			$Camera2D.zoom *= 1.1
		elif event.is_action_pressed("zoom_out"):
			$Camera2D.zoom /= 1.1

## Updates steering data, writing into the heading and spin fields of the script.
func update_steering() -> void:
	heading = Vector2.ZERO
	spin = 0
	if Input.is_action_pressed("ship_engine_up"):
		heading.y -= 1
	if Input.is_action_pressed("ship_engine_down"):
		heading.y += 1
	if Input.is_action_pressed("ship_engine_left"):
		heading.x -= 1
	if Input.is_action_pressed("ship_engine_right"):
		heading.x += 1
	if Input.is_action_pressed("ship_engine_clockwise"):
		spin -= 1
	if Input.is_action_pressed("ship_engine_counterclockwise"):
		spin += 1

## Utility function for external use.
func enable_control() -> void:
	is_controlled = true
	$Camera2D.enabled = true
## Utility function for external use.
func disable_control() -> void:
	is_controlled = false
	$Camera2D.enabled = false
