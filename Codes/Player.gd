extends KinematicBody2D
# Constants
const UP_direction = Vector2(0,-1)
export (int) var GRAVITY = 1000
export (int) var ACC = 30
export (int) var JUMP = 700
export (int) var max_speed = 200
# Variables
var vel = Vector2()

func _physics_process(delta):
	vel.y += GRAVITY * delta
	mouvement_loop(delta)
	move_and_slide(vel, UP_direction) # bouge le slide de la vitesse :vel:
		
func mouvement_loop(delta):
	var right = Input.is_action_pressed("ui_right") # detecte le mapping de touche "ui_right"
	var left  = Input.is_action_pressed("ui_left")
	var jump  = Input.is_action_just_pressed("ui_select")
	
	var curr_max_speed = 2*max_speed if Input.is_action_pressed("Shift") else max_speed
	var dirX = int(right) - int(left)
# Dir X loop
	if dirX == +1:
		vel.x = min(vel.x+ACC,curr_max_speed)
	elif dirX == -1:
		vel.x = max(vel.x-ACC,-curr_max_speed)
	else:
		vel.x = lerp(vel.x, 0, 0.80) # Va de vel.x à 0 par tranche de 80%
# Dir Y loop
	if is_on_floor():
		if jump: vel.y = -JUMP
		elif vel.y > 0: vel.y = 0
# Print on log
	print(vel.x, " , ", vel.y, " , ", dirX)
	

	
