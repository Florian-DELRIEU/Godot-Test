extends KinematicBody2D

var vel = Vector2()
var speed

func _process(delta):
	vel.x = 0
	vel.y = 0
	speed = 200 if Input.is_action_pressed("Shift") else 100
	
	if Input.is_action_pressed("ui_right"):  # detecte le mapping de touche "ui_right"
		vel.x += speed
	if Input.is_action_pressed("ui_left"):
		vel.x -= speed
	if Input.is_action_pressed("ui_down"):
		vel.y += speed
	if Input.is_action_pressed("ui_up"):
		vel.y -= speed
	move_and_slide(vel) # bouge le slide de la vitesse :vel:
	
	print("Speed :", vel.x," , ", vel.y)
