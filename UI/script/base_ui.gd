extends Control


@onready var health_bar = $VBoxContainer/health_box/VBoxContainer/health
@onready var ammo_count = $VBoxContainer/head/MarginContainer/VBoxContainer/ammo/ammo_label
@onready var kill_count = $VBoxContainer/head/MarginContainer/VBoxContainer/kill/score
@onready var boss_bar = $VBoxContainer/head/BOSS_health_bar

@onready var player



func _ready():
	boss_bar.visible = false

func _process(_delta: float) -> void:
	health_bar.value = lerp(health_bar.value, player.health, 0.1)

	if abs(health_bar.value - player.health) < 01:
		health_bar.value = player.health

	ammo_count.text = ": " + str(player.ammo)
	kill_count.text = ": " + str(player.score)
