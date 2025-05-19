extends Node

@onready var bird: Bird = $"../Bird"
@onready var pipe_spawner: PipeSpawner = $"../PipeSpawner"
@onready var ground: Ground = $"../Ground"


var points = 0

func _ready():
	bird.game_started.connect(on_game_started)
	ground.bird_crashed.connect(end_game)
	pipe_spawner.bird_crashed.connect(end_game)
	pipe_spawner.point_scored.connect(on_point_scored)

func on_game_started():
	pipe_spawner.start_spawning_pipes()

func end_game():
	ground.stop()
	bird.kill()
	pipe_spawner.stop()

func on_point_scored():
	points += 1
