extends Node2D

@export var is_controlled := false
@export var walk_speed := 50
@export var run_speed := 85

func _process(delta: float) -> void:
	if is_controlled:
		update_heading()
		handle_control(delta)

func update_heading():
	var viewport := get_viewport()
	var viewport_size := viewport.get_visible_rect().size
	var mouse_pos := viewport.get_mouse_position()-viewport_size/2
	var relative_rot := mouse_pos.angle_to( Vector2.RIGHT.rotated(rotation) )
	relative_rot = relative_rot*180/PI
	
	if(relative_rot > 54):
		$HumanHead.state = "turn_left"
	elif(relative_rot > 18):
		$HumanHead.state = "tilt_left"
	elif(relative_rot < -54):
		$HumanHead.state = "turn_right"
	elif(relative_rot < -18):
		$HumanHead.state = "tilt_right"
	else:
		$HumanHead.state = "forward"

func handle_control(delta: float) -> void:
	var move_vector := Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		move_vector.y -= 1
	if Input.is_action_pressed("ui_down"):
		move_vector.y += 1
	if Input.is_action_pressed("ui_left"):
		move_vector.x -= 1
	if Input.is_action_pressed("ui_right"):
		move_vector.x += 1
	
	if(move_vector.length() > 0):
		if(Input.is_action_pressed("character_run")):
			position += move_vector.normalized()*delta*run_speed
			play_animation("walk", run_speed*1.0/walk_speed*1.0)
		else:
			position += move_vector.normalized()*delta*walk_speed
			play_animation("walk", 1)
		rotation = move_vector.angle()
	else:
		play_animation("RESET")

func play_animation(animation: String, speed: float = 1.0) -> void:
	$HumanHead.play_animation(animation, speed)
	$HumanTorso.play_animation(animation, speed)
	$HumanArms.play_animation(animation, speed)
	$HumanLegs.play_animation(animation, speed)

func change_skin(skin: String, limb: String = "") ->void:
	match limb:
		"Head":
			$HumanHead.change_skin(skin)
		"Torso":
			$HumanTorso.change_skin(skin)
		"Arms":
			$HumanArms.change_skin(skin)
		"Legs":
			$HumanLegs.change_skin(skin)
		_:
			$HumanHead.change_skin(skin)
			$HumanTorso.change_skin(skin)
			$HumanArms.change_skin(skin)
			$HumanLegs.change_skin(skin)
			pass
