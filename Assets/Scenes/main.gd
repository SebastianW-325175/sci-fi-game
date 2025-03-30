extends Node2D
# Temporary script, used to set up the demo

func _ready() -> void:
	get_node("SubViewportContainer/SubViewport/Kairos").enable_control() 

func _process(_delta) -> void:
	# Below is some temporary code to get the displays running
	var ship_node := get_node("SubViewportContainer/SubViewport/Kairos")
	var ship_pos : Vector2i = ship_node.position
	var ship_vel : Vector2i = ship_node.linear_velocity
	var ship_rot : int = rad_to_deg(ship_node.angular_velocity)
	$Location.text = "Location: ("+str(ship_pos.x)+", "+str(ship_pos.y)+")"
	$Velocity.text = "Velocity: ("+str(ship_vel.x)+", "+str(ship_vel.y)+")"
	$Velocity_Indicator.set_point_position(1, ship_node.linear_velocity*2)
	$Heading_Indicator.set_point_position(1, ship_node.heading*100)
	$Rotation.text = "Rotation: "+str(ship_rot)
