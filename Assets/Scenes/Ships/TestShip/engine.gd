extends Node2D

var total_thrust_force := Vector2(0.0, 0.0)
var total_thrust_origin := Vector2(0.0, 0.0)
var max_thrust := 1000.0
var current_thrust := 0.0
var is_active := false

func update_thrust() -> void:
	total_thrust_force = Vector2(-current_thrust, 0.0)
	total_thrust_force = total_thrust_force.rotated(rotation)
	total_thrust_origin = position

func enable_thrust() -> void:
	current_thrust = max_thrust
	$GPUParticles2D.emitting = true

func disable_thrust() -> void:
	current_thrust = 0.0
	$GPUParticles2D.emitting = false
