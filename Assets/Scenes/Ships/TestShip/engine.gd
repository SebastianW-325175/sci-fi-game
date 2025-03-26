extends Node2D

var force := Vector2.ZERO
var thrust := -1000
var is_active := false

func _ready() -> void:
	force.x = thrust
	force = force.rotated(rotation)

func enable_thrust() -> void:
	is_active = true
	$GPUParticles2D.emitting = true

func disable_thrust() -> void:
	is_active = false
	$GPUParticles2D.emitting = false
