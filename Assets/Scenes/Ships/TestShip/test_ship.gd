extends RigidBody2D

var is_controlled := false

func enable_control() -> void:
	is_controlled = true
	$Camera2D.enabled = true

func disable_control() -> void:
	is_controlled = false
	$Camera2D.enabled = false

func _physics_process(delta) -> void:
	$EngineHandler.update_thrust()
	var engine_count : int = $EngineHandler.engine_array.size()
	for i in engine_count:
		var thrust_force : Vector2 = $EngineHandler.thrust_force_array[i].rotated(rotation)
		var thrust_origin : Vector2 = $EngineHandler.thrust_origin_array[i].rotated(rotation)
		apply_force(thrust_force, thrust_origin)

func _process(delta) -> void:
	if is_controlled:
		if Input.is_action_just_pressed("ship_engine_all"):
			$EngineHandler.enable_thrust()
		if Input.is_action_just_released("ship_engine_all"):
			$EngineHandler.disable_thrust()
		if Input.is_action_just_pressed("ship_engine_1"):
			$EngineHandler.enable_thrust(1)
		if Input.is_action_just_released("ship_engine_1"):
			$EngineHandler.disable_thrust(1)
		if Input.is_action_just_pressed("ship_engine_2"):
			$EngineHandler.enable_thrust(2)
		if Input.is_action_just_released("ship_engine_2"):
			$EngineHandler.disable_thrust(2)
