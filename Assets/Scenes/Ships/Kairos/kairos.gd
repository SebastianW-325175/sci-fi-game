extends RigidBody2D

var is_controlled := false

func enable_control() -> void:
	is_controlled = true
	$Camera2D.enabled = true

func disable_control() -> void:
	is_controlled = false
	$Camera2D.enabled = false

func _physics_process(delta) -> void:
	var active_engines = $EngineHandler.get_active_engines()
	for engine in active_engines:
		var force : Vector2 = engine.force.rotated(rotation)
		var origin : Vector2 = engine.position.rotated(rotation)
		apply_force(force, origin)

func _input(event) -> void:
	if is_controlled:
		if Input.is_action_just_pressed("ship_engine_all"):
			$EngineHandler.enable_thrust()
		elif Input.is_action_just_released("ship_engine_all"):
			$EngineHandler.disable_thrust()
		elif Input.is_action_just_pressed("ship_engine_1"):
			$EngineHandler.enable_thrust(1)
		elif Input.is_action_just_released("ship_engine_1"):
			$EngineHandler.disable_thrust(1)
		elif Input.is_action_just_pressed("ship_engine_2"):
			$EngineHandler.enable_thrust(2)
		elif Input.is_action_just_released("ship_engine_2"):
			$EngineHandler.disable_thrust(2)
		elif Input.is_action_just_pressed("ship_engine_3"):
			$EngineHandler.enable_thrust(3)
		elif Input.is_action_just_released("ship_engine_3"):
			$EngineHandler.disable_thrust(3)
		elif Input.is_action_just_pressed("ship_engine_4"):
			$EngineHandler.enable_thrust(4)
		elif Input.is_action_just_released("ship_engine_4"):
			$EngineHandler.disable_thrust(4)
		elif Input.is_action_just_pressed("ship_engine_5"):
			$EngineHandler.enable_thrust(5)
		elif Input.is_action_just_released("ship_engine_5"):
			$EngineHandler.disable_thrust(5)
		elif Input.is_action_just_pressed("ship_engine_6"):
			$EngineHandler.enable_thrust(6)
		elif Input.is_action_just_released("ship_engine_6"):
			$EngineHandler.disable_thrust(6)
		elif Input.is_action_just_pressed("ship_engine_7"):
			$EngineHandler.enable_thrust(7)
		elif Input.is_action_just_released("ship_engine_7"):
			$EngineHandler.disable_thrust(7)
		elif Input.is_action_just_pressed("ship_engine_8"):
			$EngineHandler.enable_thrust(8)
		elif Input.is_action_just_released("ship_engine_8"):
			$EngineHandler.disable_thrust(8)
		elif Input.is_action_just_pressed("ship_engine_9"):
			$EngineHandler.enable_thrust(9)
		elif Input.is_action_just_released("ship_engine_9"):
			$EngineHandler.disable_thrust(9)
		elif Input.is_action_just_pressed("zoom_in"):
			$Camera2D.zoom *= 1.1
		elif Input.is_action_just_pressed("zoom_out"):
			$Camera2D.zoom /= 1.1
