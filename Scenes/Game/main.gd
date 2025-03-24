extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Human.is_controlled = true
	$Human.change_skin("White")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Camera2D.position = $Human.position
