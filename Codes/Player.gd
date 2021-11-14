extends KinematicBody2D
# Constants
const GRAVITY = 1000
const JUMP = 700
const UP_direction = Vector2(0,-1)
const ACC = 30
# Variables
var vel = Vector2()
var max_speed

func _physics_process(delta):
	vel.y += GRAVITY * delta
	mouvement_loop(delta)
	move_and_slide(vel, UP_direction) # bouge le slide de la vitesse :vel:
		
func mouvement_loop(delta):
	var right = Input.is_action_pressed("ui_right") # detecte le mapping de touche "ui_right"
	var left  = Input.is_action_pressed("ui_left")
	var jump  = Input.is_action_just_pressed("ui_select")
	
	var max_speed = 400 if Input.is_action_pressed("Shift") else 200
	var dirX = int(right) - int(left)
# Dir X loop
	if dirX == +1:
		vel.x = min(vel.x+ACC,max_speed)
	elif dirX == -1:
		vel.x = max(vel.x-ACC,-max_speed)
	else:
		vel.x = lerp(vel.x, 0, 0.80) # Va de vel.x à 0 par tranche de 80%
# Dir Y loop
	if is_on_floor():
		if jump: vel.y = -JUMP
		elif vel.y > 0: vel.y = 0
# Print on log
	print(vel.x, " , ", vel.y, " , ", dirX)
	

	
