extends Sprite

var angle = 0
var delta_angle

func _process(delta):
	angle += delta_angle
	self.rotation_degrees = angle
