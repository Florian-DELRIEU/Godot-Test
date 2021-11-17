extends KinematicBody2D

var left = bool()
var right = bool()
var up = bool()
var down = bool()
var dirX = int()
var dirY = int()

#var slider = get_parent().get_node("SpeedSlider")
export (int, 0, 10, 1) var speed

func _process(delta):
	checkInputs()
	mooving_loop()

func checkInputs():
	left = Input.is_action_pressed("ui_left")
	right = Input.is_action_pressed("ui_right")
	up = Input.is_action_pressed("ui_up")
	down = Input.is_action_pressed("ui_down")
	dirX = int(right) - int(left)
	dirY = int(down) - int(up)

func mooving_loop():
	position.x += dirX * speed
	position.y += dirY * speed
