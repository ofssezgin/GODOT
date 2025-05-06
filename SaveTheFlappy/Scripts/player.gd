extends Area2D

signal gameover

@onready var anim_sprite: AnimatedSprite2D = get_node("AnimatedSprite2D")
@onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

const JUMP_VELOCITY = -200.0
const rot_speed = 300.0

var velocity: Vector2 = Vector2.ZERO

func _ready():
	random_bird()
	gravity = 500.0
	player_move(false)
	anim_player.play("get_ready")
	anim_sprite.play()

func random_bird() -> void:
	var animation = anim_sprite.sprite_frames.get_animation_names()
	anim_sprite.animation = animation[randi() % animation.size()]

func _process(delta):
	velocity.y += gravity * delta
	if rotation_degrees <= 45.0 and velocity.y > 0:
		rotation_degrees += rot_speed * delta
	else:
		if rotation_degrees >= -45.0:
			rotation_degrees -= rot_speed * delta
	if Input.is_action_just_pressed("flap"):
		velocity.y = JUMP_VELOCITY
		anim_sprite.play()
	position += velocity * delta


func _on_body_entered(body: Node2D) -> void:
	anim_sprite.stop()
	gameover.emit()

func player_move(value: bool) -> void:
	set_process(value)
