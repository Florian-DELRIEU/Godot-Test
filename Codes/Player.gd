extends KinematicBody2D

var vel = Vector2()

func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		vel.x += 1
	if Input.is_action_pressed("ui_left"):
		vel.x -= 1
	if Input.is_action_pressed("ui_down"):
		vel.y += 1
	if Input.is_action_pressed("ui_up"):
		vel.y -= 1
	move_and_slide(vel)
