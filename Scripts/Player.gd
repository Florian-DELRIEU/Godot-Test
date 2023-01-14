 extends KinematicBody2D

var vel = Vector2()
var speed = 200

func _ready(): # when player is activated
	pass

func _process(delta):
	vel.x = 0
	vel.y = 0
	if Input.is_action_pressed("ui_right"):
		vel.x += speed
	if Input.is_action_pressed("ui_left"):
		vel.x -= speed
	if Input.is_action_pressed("ui_down"):
		vel.y += speed
	if Input.is_action_pressed("ui_up"):
		vel.y -= speed
	move_and_slide(vel)
