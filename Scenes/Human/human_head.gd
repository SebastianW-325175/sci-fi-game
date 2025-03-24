extends Sprite2D

var forward_texture : Resource
var tilt_left_texture : Resource
var tilt_right_texture : Resource
var turn_left_texture : Resource
var turn_right_texture : Resource

@export var state := "forward":
	set (value):
		state = value
		update_sprite()
@export var skin := "Template":
	set (value):
		skin = value.capitalize()
		update_resources()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_resources()
	update_sprite()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_sprite() -> void:
	match state:
		"forward":
			texture = forward_texture
		"tilt_left":
			texture = tilt_left_texture
		"tilt_right":
			texture = tilt_right_texture
		"turn_left":
			texture = turn_left_texture
		"turn_right":
			texture = turn_right_texture
		_:
			texture = forward_texture

func update_resources() -> void:
	forward_texture = load("res://Assets/Textures/Human/Base/"+skin+"/Head/forward.png")
	tilt_left_texture = load("res://Assets/Textures/Human/Base/"+skin+"/Head/tilt_left.png")
	tilt_right_texture = load("res://Assets/Textures/Human/Base/"+skin+"/Head/tilt_right.png")
	turn_left_texture = load("res://Assets/Textures/Human/Base/"+skin+"/Head/turn_left.png")
	turn_right_texture = load("res://Assets/Textures/Human/Base/"+skin+"/Head/turn_right.png")

func play_animation(animation: String, speed: float = 1.0) -> void:
	$AnimationPlayer.play(animation, -1, speed)

func change_skin(new_skin: String) -> void:
	skin = new_skin
