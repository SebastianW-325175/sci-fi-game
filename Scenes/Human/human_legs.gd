extends Sprite2D

var idle_texture : Resource
var left_forward_texture : Resource
var right_forward_texture : Resource

@export var state := "idle":
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

func update_sprite():
	match state:
		"idle":
			texture = idle_texture
		"left_forward":
			texture = left_forward_texture
		"right_forward":
			texture = right_forward_texture
			
func update_resources() -> void:
	idle_texture = load("res://Assets/Textures/Human/Base/"+skin+"/Legs/idle.png")
	left_forward_texture = load("res://Assets/Textures/Human/Base/"+skin+"/Legs/left_forward.png")
	right_forward_texture = load("res://Assets/Textures/Human/Base/"+skin+"/Legs/right_forward.png")

func play_animation(animation: String, speed: float = 1.0) -> void:
	$AnimationPlayer.play(animation, -1, speed)

func change_skin(new_skin: String) -> void:
	skin = new_skin
