extends KinematicBody2D
# Constants
const GRAVITY = 1000
const JUMP = 700
const UP_direction = Vector2(0,-1)
# Variables
var vel = Vector2()
var speed

func _process(delta):
	pass
	
func _physics_process(delta):
	vel.x = 0
	vel.y += GRAVITY * delta
	mouvement_loop(delta)
	move_and_slide(vel, UP_direction) # bouge le slide de la vitesse :vel:
		
func mouvement_loop(delta):
	var right = Input.is_action_pressed("ui_right") # detecte le mapping de touche "ui_right"
	var left  = Input.is_action_pressed("ui_left")
	var jump  = Input.is_action_just_pressed("ui_select")
	var speed = 400 if Input.is_action_pressed("Shift") else 200
	
	vel.x = (int(right) - int(left)) * speed
	if jump and is_on_floor(): vel.y = -JUMP
	if is_on_floor():
		if jump: vel.y = -JUMP
		elif vel.y > 0: vel.y = 0
	print(vel.x, " , ", vel.y, " , ", jump)
	

	
