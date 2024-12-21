extends Control

@onready var pause_menu = $pause_menu
@onready var gameover_menu = $gameover
@onready var base_ui = $base_ui

@onready var player = %player

var is_gameover= false
var is_paused = false

func _ready() -> void:
	pause_menu.player = %player
	base_ui.player = %player
	gameover_menu.player = %player

	pause_menu.visible = false
	gameover_menu.visible = false
	base_ui.visible = !false


func _process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("esc"):
		is_paused = !is_paused


	if is_gameover or is_paused:
		get_tree().paused = true
	else: get_tree().paused = false


	
	if is_gameover:
		pause_menu.visible = false
		gameover_menu.visible = !false
		base_ui.visible = false
	elif is_paused:
		pause_menu.visible = !false
		gameover_menu.visible = false
		base_ui.visible = !false
	else: 
		pause_menu.visible = false
		gameover_menu.visible = false
		base_ui.visible = !false

