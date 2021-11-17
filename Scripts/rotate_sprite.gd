extends Sprite

export (bool) var is_clockwise = true

var angle = 0
var delta_angle = 1

func _process(delta):
	angle += delta_angle
	if angle > 359: angle = 0
	self.rotation_degrees = angle
	print("Angle = " +str(angle))

func clock_button_pressed():
	if is_clockwise:delta_angle = abs(delta_angle)
	else:			delta_angle = -abs(delta_angle)
	is_clockwise = not is_clockwise
	
