extends KinematicBody2D

var vel = Vector2()
const speed = 100

func _ready():
	pass # Replace with function body.

func _process(delta):
	vel.x = 0
	vel.y = 0
	
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
