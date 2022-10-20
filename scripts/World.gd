extends Node2D


signal life_changed(life)
signal life_changed2(life)

func _ready() -> void:
	VisualServer.set_default_clear_color(Color.black)

func _on_Player1_life_changed(life) -> void:
	emit_signal("life_changed", life)


func _on_Player2_life_changed(life) -> void:
	emit_signal("life_changed2", life)
