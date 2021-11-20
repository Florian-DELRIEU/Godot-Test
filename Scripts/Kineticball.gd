extends RigidBody2D

var initial_direction = rand_range(0,359)
export (float,-1,1,0.1) var Bounce_Coeff = 1
export (float,-1,1,0.1) var Friction_Coeff = 1
export (float,-1,1,0.1) var Linear_Coeff = 1

func _process(delta):
	bounce = Bounce_Coeff
	friction = Friction_Coeff
	linear_damp = Linear_Coeff
	scale = Vector2(0.5,0.5)
	$CollisionShape2D.scale = Vector2(0.5,0.5)
	var current_speed = linear_velocity
