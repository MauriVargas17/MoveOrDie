extends Node2D

func _ready() -> void:
	VisualServer.set_default_clear_color(Color.black)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed('ui_accept'):
		get_tree().change_scene('res://scenes/World.tscn')