extends KinematicBody2D

var vel = Vector2()
var speed
const GRAVITY = 9.81 * 10
const JUMP = 200

func _process(delta):
	pass
	
func _physics_process(delta):
	vel.x = 0
	vel.y += GRAVITY * delta
	mouvement_loop(delta)
		
func mouvement_loop(delta):
	var right = Input.is_action_pressed("ui_right") # detecte le mapping de touche "ui_right"
	var left  = Input.is_action_pressed("ui_left")
	var down  = Input.is_action_pressed("ui_down")
	var up    = Input.is_action_pressed("ui_up")
	var jump  = Input.is_action_just_pressed("ui_select")
	
	var speed = 400 if Input.is_action_pressed("Shift") else 200
	
	var dirX = int(right) - int(left)
	var dirY = int(down) - int(up)# + (GRAVITY - JUMP ) * delta
	print(dirX, " , ", dirY)
	
	vel.x = speed*dirX
	vel.y = speed*dirY
	move_and_slide(vel) # bouge le slide de la vitesse :vel:
