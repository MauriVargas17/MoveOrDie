extends Control

func _ready() -> void:
	pass


func _on_player1_life_changed(life) -> void:
	$ProgressBar.value = life
