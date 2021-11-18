extends KinematicBody2D

var left = bool()
var right = bool()
var up = bool()
var down = bool()
var dirX = int()
var dirY = int()
var PV = 100

export (int) var speed = 10

func _process(delta):
	checkInputs()
	mooving_loop()
	$Player_label.text = "PV = " + str(PV)

func checkInputs():
	left = Input.is_action_pressed("ui_left")
	right = Input.is_action_pressed("ui_right")
	up = Input.is_action_pressed("ui_up")
	down = Input.is_action_pressed("ui_down")
	dirX = int(right) - int(left)
	dirY = int(down) - int(up)

func mooving_loop():
	move_and_collide(Vector2(dirX,dirY)*speed) # to collide 

