extends Control


@onready var health_bar = $health
var player



func _process(_delta: float) -> void:
	health_bar.value = player.health
