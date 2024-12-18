extends Control


func _ready() -> void:
	var pause_menu = $pause_menu
	var gameover_menu = $gameover
	var base_ui = $base_ui

	pause_menu.visible = false
	gameover_menu.visible = false
	base_ui.visible = true

	base_ui.player = %player

func _process(delta: float) -> void:
	pass
