extends KinematicBody2D

var velocity = Vector2(velocity_calculator(rand_range(-100, 100)), 70)

signal player1_is_dead()
signal player2_is_dead()

func velocity_calculator(rand_velocity):
	if rand_velocity < 0:
		if rand_velocity > -50:
			return -70
		else:
			return rand_velocity
	else:
		if rand_velocity < 50:
			return 70
		else: 
			return rand_velocity 

func _physics_process(delta: float) -> void:

	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.normal)
		velocity.x *= 1.05
		velocity.y *= 1.05
		
		
func _on_Area2D_body_entered(body:Node) -> void:
			if body is Player:
				print("Player 1 was hit")
				emit_signal('player1_is_dead')
				
			elif body is Player2:
				print('Player 2 was hit')
				emit_signal('player2_is_dead')
		
