extends Control

func _ready() -> void:
	pass 

func _on_player2_life_changed2(life) -> void:
	$ProgressBar.value = life
