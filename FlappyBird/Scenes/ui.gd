extends CanvasLayer

class_name UI

@onready var points_label: Label = $MarginContainer/PointsLabel
@onready var game_over_box: VBoxContainer = $MarginContainer/GameOverBox

func _ready():
	points_label.text = "%d" % 0

func update_points(points: int):
	points_label.text = "%d"  % points

func on_game_over():
	game_over_box.visible = true

func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
