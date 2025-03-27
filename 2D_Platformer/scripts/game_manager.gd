extends Node

var score = 0
@onready var end_game: Label = $EndGame

func add_point():
	score += 1
	end_game.text = "You collected " + str(score) + " coins."
