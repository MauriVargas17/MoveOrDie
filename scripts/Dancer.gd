extends KinematicBody2D

var state = 0
onready var state_machine = $AnimationTree.get("parameters/playback")

func _process(delta: float) -> void:
    if state == 0:
        state_machine.travel('jump')
    elif state == 1:
        state_machine.travel('celeb')
    else:
        state_machine.travel('dance')

func _on_Player_life_changed(life) -> void:
    if life > 250:
        state = 0
    elif life < 250 and life > 100:
        state = 1
    elif life < 100:
        state = 2
        