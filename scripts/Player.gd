extends KinematicBody2D
class_name Player

export(int) var JUMP_FORCE = -230
export(int) var JUMP_RELEASE_FORCE = -130
export(int) var MAX_SPEED = 150
export(int) var ACCELERATION = 30
export(int) var FRICTION = 10
export(int) var GRAVITY = 8
export(int) var ADDITIONAL_GRAVITY = 4

signal life_changed(life)


# export(int) var JUMP_FORCE = -200
# export(int) var JUMP_RELEASE_FORCE = -60
# export(int) var MAX_SPEED = 150
# export(int) var ACCELERATION = 10
# export(int) var FRICTION = 10
# export(int) var GRAVITY = 6
# export(int) var ADDITIONAL_GRAVITY = 4

var velocity = Vector2.ZERO
export (int) var life = 300
var is_dying = true

onready var animatedSprite = $AnimatedSprite

func _ready() -> void:
	animatedSprite.frames = load('res://PlayerNervus.tres')

func _physics_process(delta: float) -> void:

	apply_gravity()
	var input = Vector2.ZERO
	input.x = Input.get_action_strength(('ui_right')) - Input.get_action_strength(('ui_left'))

	apply_life_drainer()
	

	if input.x == 0:
		is_dying = true
		apply_friction()
		animatedSprite.animation = 'Idle'
	else: 
		is_dying = false
		apply_acceleration(input.x)
		animatedSprite.animation = 'Run'
		if input.x > 0:
			animatedSprite.flip_h = false
		else:
			animatedSprite.flip_h = true
	if is_on_floor():
		
		if Input.is_action_just_pressed('ui_up'):
			velocity.y = JUMP_FORCE
	else:
		is_dying = true
		animatedSprite.animation = 'Jump'
		if Input.is_action_just_released('ui_up') and velocity.y < JUMP_RELEASE_FORCE:
			velocity.y = JUMP_RELEASE_FORCE	

		if velocity.y > 0:
			velocity.y += ADDITIONAL_GRAVITY
	var was_in_air = not is_on_floor()
	velocity = move_and_slide(velocity, Vector2.UP)
	if was_in_air and is_on_floor():
		animatedSprite.animation = 'Run'
		animatedSprite.frame = 1


func apply_gravity():
	velocity.y += GRAVITY
	velocity.y = min(velocity.y, 300)

func apply_life_drainer():
	if is_dying and life > 0:
		life -= 1
	elif life <= 0:
		# get_tree().reload_current_scene()	
		get_tree().change_scene('res://scenes/Again.tscn')
	elif life < 300:
		life += 2
	emit_signal('life_changed', life)
	
	# print(life)

func apply_friction():
	velocity.x = move_toward(velocity.x, 0, FRICTION)
	
func apply_acceleration(amount):
	velocity.x = move_toward(velocity.x, MAX_SPEED * amount, ACCELERATION)
	


func _on_SpikeBall_player1_is_dead() -> void:
	life = -10
