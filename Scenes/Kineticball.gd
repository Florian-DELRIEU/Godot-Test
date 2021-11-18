extends RigidBody2D

var initial_direction = rand_range(0,359)

func _ready():
	linear_velocity.angle_to = initial_direction

func _process(delta):
	bounce = 1
	friction = 0
	linear_damp = 0
	var current_speed = linear_velocity
