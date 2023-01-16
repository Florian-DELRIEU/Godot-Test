extends KinematicBody2D
var speed = 1000
var vel = Vector2()

func Start(pos,dir):
	# position et direction du tir
	self.position = pos # position et une variable prédefinie de "KinematicBody2D"
	vel = Vector2(speed*dir,0)  # dir = 1 ou -1

func _process(delta):
	var collision = move_and_collide(vel)
	pass
