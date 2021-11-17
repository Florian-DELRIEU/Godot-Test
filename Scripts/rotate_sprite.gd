extends Sprite

var angle = 0
var delta_angle = 1

func _process(delta):
	angle += delta_angle
	if angle > 359: angle = 0
	self.rotation_degrees = angle
	print("Angle = " +str(angle))
