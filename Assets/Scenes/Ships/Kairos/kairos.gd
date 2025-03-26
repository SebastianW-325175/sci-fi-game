extends RigidBody2D

var is_controlled := false
var heading : Vector2 = Vector2.ZERO

func enable_control() -> void:
	is_controlled = true
	$Camera2D.enabled = true

func disable_control() -> void:
	is_controlled = false
	$Camera2D.enabled = false

func _physics_process(delta) -> void:
	update_heading()
	$EngineHandler.update_engines(heading, rotation)
	var active_engines = $EngineHandler.get_active_engines()
	for engine in active_engines:
		var force : Vector2 = engine.force.rotated(rotation)
		var origin : Vector2 = engine.position.rotated(rotation)
		apply_force(force, origin)

func update_heading() -> void:
	heading = Vector2.ZERO
	if Input.is_action_pressed("ship_engine_up"):
		heading.y -= 1
	if Input.is_action_pressed("ship_engine_down"):
		heading.y += 1
	if Input.is_action_pressed("ship_engine_left"):
		heading.x -= 1
	if Input.is_action_pressed("ship_engine_right"):
		heading.x += 1

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
