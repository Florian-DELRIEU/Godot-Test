extends KinematicBody2D
# Constants
const DEBUG = true
const UP_direction = Vector2(0,-1)
# Variables
export (int) var GRAVITY = 1000
export (int) var ACC = 30
export (int) var JUMP = 700
export (int) var max_speed = 100
var vel = Vector2()
var jump = false
var curr_max_speed
var move_anim
var dirX = 0

func _ready(): pass
#	randomize() # Obligé pour bien avoir des valeurs random

func Timer_timeout():
	var m = int(rand_range(-10,10))
	if DEBUG: print(m)
	if	 m < -2: dirX = -1
	elif m > 2:  dirX = 1
	else:		dirX = 0
	
	var j = int(rand_range(-3,3))
	if DEBUG: print(m)
	if	 j < 0:  jump = false
	elif j > 0:  jump = true

func _physics_process(delta):
	mouvement_loop(delta) 
	vel.y += GRAVITY * delta
	vel = move_and_slide(vel, UP_direction) # bouge le slide de la vitesse :vel:
	
func mouvement_loop(delta):
	if 	 dirX ==  1:
		$Sprite.flip_h = true
		anim_loop("walk")
	elif dirX == -1:
		$Sprite.flip_h = false
		anim_loop("walk")
	else:
		anim_loop("idle")
	if jump and is_on_floor(): 
		vel.y = -JUMP
	if is_on_wall():
		dirX *= -1
	vel.x = dirX * max_speed
	
func anim_loop(animation):
	if $Anim_ennemy.current_animation != animation:
		$Anim_ennemy.play(animation)
	

