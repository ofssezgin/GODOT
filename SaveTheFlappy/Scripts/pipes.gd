extends CharacterBody2D

signal update_score

const pipe_texture = ["res://Assets/Sprite/FlappyAsset/pipe-green.png","res://Assets/Sprite/FlappyAsset/pipe-red.png"]
@onready var top_pipe: = get_node("top_pipe")
@onready var bottom_pipe: = get_node("bottom_pipe")

const SPEED: = -100.0

func _ready() -> void:
	var pipe = (pipe_texture[(randi() % pipe_texture.size())])
	top_pipe.get_node("Sprite2D").texture = load(pipe)
	bottom_pipe.get_node("Sprite2D").texture = load(pipe)
	velocity = Vector2(SPEED, 0)

func _physics_process(delta):
	move_and_collide(velocity * delta)


func _on_screen_exited():
	Disable_Shape(top_pipe)
	Disable_Shape(bottom_pipe)
	queue_free()

func Disable_Shape(shape: Node) -> void:
	shape.set_deferred("disabled", true)


func _on_area_2d_area_exited(area):
	update_score.emit()
	
