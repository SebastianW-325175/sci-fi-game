extends Node2D

var force := Vector2.ZERO
var thrust := -1000
var is_active := false
var is_overriden := false

func _ready() -> void:
	force.x = thrust
	force = force.rotated(rotation)

func enable_thrust() -> void:
	is_active = true
	if not is_overriden:
		$GPUParticles2D.emitting = true

func disable_thrust() -> void:
	is_active = false
	if not is_overriden:
		$GPUParticles2D.emitting = false

func enable_thrust_override() -> void:
	is_overriden = true
	$GPUParticles2D.emitting = true

func disable_thrust_override() -> void:
	is_overriden = false
	$GPUParticles2D.emitting = false
