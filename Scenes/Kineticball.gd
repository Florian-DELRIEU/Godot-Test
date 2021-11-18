extends RigidBody2D

func _process(delta):
	bounce = 1
	friction = 0
	linear_damp = 0
	var current_speed = linear_velocity
	print(current_speed.length())
