extends KinematicBody2D
# Constants
const DEBUG = true
const UP_direction = Vector2(0,-1)
# Variables
export (int) var GRAVITY = 1000
export (int) var ACC = 30
export (int) var JUMP = 700
export (int) var max_speed = 50
var vel = Vector2()
var jump_count = 0
var curr_max_speed
var move_anim
var dirX = 0

func _ready(): pass
#	randomize() # Obligé pour bien avoir des valeurs random

func Timer_timeout():
	var m = int(rand_range(-3,3))
	if DEBUG: print(m)
	if	 m < -1: dirX = -1
	elif m > 1:  dirX = 1
	else:		dirX = 0

func _physics_process(delta):
	mouvement_loop(delta) 
	vel.y += GRAVITY * delta
	vel = move_and_slide(vel, UP_direction) # bouge le slide de la vitesse :vel:
	
func mouvement_loop(delta):
	vel.x = dirX * max_speed
	if 	 dirX ==  1:
		$Sprite.flip_h = true
		anim_loop("walk")
	elif dirX == -1:
		$Sprite.flip_h = false
		anim_loop("walk")
	else:
		anim_loop("idle")

func anim_loop(animation):
	if $Anim_ennemy.current_animation != animation:
		$Anim_ennemy.play(animation)
	

