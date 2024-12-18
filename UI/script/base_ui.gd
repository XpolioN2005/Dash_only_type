extends Control


@onready var health_bar = $health
var player



func _process(_delta: float) -> void:
	health_bar.value = lerp(health_bar.value, player.health, 0.1)

	print(health_bar.value)

	if abs(health_bar.value - player.health) < 01:
		health_bar.value = player.health
