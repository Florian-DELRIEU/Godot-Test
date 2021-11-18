extends RigidBody2D

var initial_direction = rand_range(0,359)


func _process(delta):
	bounce = 1
	friction = 0
	linear_damp = 0
	scale = Vector2(0.5,0.5)
	$CollisionShape2D.scale = Vector2(0.5,0.5)
	var current_speed = linear_velocity
