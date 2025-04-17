extends ParallaxBackground

@onready var sprite_2d: Sprite2D = $Sky/Sprite2D

const scroll_speed = 100

func _ready():
	sprite_2d.texture = load("res://Assets/Sprite/FlappyAsset/background-" + str(randi_range(1,2)) + ".png")

func _process(delta):
	scroll_offset.x -= scroll_speed * delta
