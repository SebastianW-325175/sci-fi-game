extends Node2D
## This script is necessary for an engine to work.

## The force vector which this engine provides when turned on.
## Properly defined only on ready.
var force := Vector2.ZERO
## The thrust force this engine can provide in px/s.
## The negation is there to make positioning engines in the editor more intuitive. 
var thrust := -1000
## The state of the engine. Defines whether the engine is turned on or off.
var is_active := false
## The manual override state. Defines whether the engine is being overriden.
var is_overriden := false

## On ready, initiate the force vector property using thrust and rotation.
func _ready() -> void:
	force.x = thrust
	force = force.rotated(rotation)

## Utility method which makes managing the state of the engine easier.
func enable_thrust() -> void:
	is_active = true
	if not is_overriden:
		$GPUParticles2D.emitting = true
## Utility method which makes managing the state of the engine easier.
func disable_thrust() -> void:
	is_active = false
	if not is_overriden:
		$GPUParticles2D.emitting = false

## Utility method which makes managing the override state easier.
func enable_thrust_override() -> void:
	is_overriden = true
	$GPUParticles2D.emitting = true
## Utility method which makes managing the override state easier.
func disable_thrust_override() -> void:
	is_overriden = false
	$GPUParticles2D.emitting = false
