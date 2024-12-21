extends Control

@onready var score_lable = $bg/menu/menu_container/lables/score

@onready var player

func _process(_delta):
	score_lable.text = "CURRENT SCORE: " + str(player.score)

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()

func _on_resume_pressed() -> void:
	get_parent().is_paused = false