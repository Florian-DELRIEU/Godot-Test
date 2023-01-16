extends KinematicBody2D
# Constants
const DEBUG = false
const UP_direction = Vector2(0,-1)
export (int) var GRAVITY = 1000
export (int) var ACC = 30
export (int) var JUMP = 700
export (int) var max_speed = 200
# Variables
var vel = Vector2()
var jump_count = 0
var curr_max_speed
var move_anim
var bullet = preload("res://Scenes/Bullet.tscn") # Précharge :bullet:
var player_side = 1 # 1==regarde a droite // -1== a gauche

func _physics_process(delta):
	mouvement_loop(delta)
	vel.y += GRAVITY * delta
	vel = move_and_slide(vel, UP_direction) # bouge le slide de la vitesse :vel:
		
func mouvement_loop(delta):
	var right = Input.is_action_pressed("ui_right") # detecte le mapping de touche "ui_right"
	var left  = Input.is_action_pressed("ui_left")
	var jump  = Input.is_action_just_pressed("ui_select")
	var run   = Input.is_action_pressed("Shift")
	var shoot = Input.is_action_just_pressed("ui_shoot")
	if is_on_floor(): jump_count = 0
# is running ?
	if run:
		curr_max_speed 	= 2*max_speed
		move_anim 		= "run"
	else:
		curr_max_speed 	= max_speed
		move_anim	 	= "walk"
	var dirX = int(right) - int(left)
# Dir X loop
	if dirX == +1:
		vel.x = min(vel.x+ACC,curr_max_speed)
		$Sprite.flip_h = false
		player_side = 1
		anim_loop(move_anim)
	elif dirX == -1:
		vel.x = max(vel.x-ACC,-curr_max_speed)
		$Sprite.flip_h = true
		player_side = -1
		anim_loop(move_anim)
	else:
		vel.x = lerp(vel.x, 0, 0.80) # Va de vel.x à 0 par tranche de 80%
		anim_loop("idle")
# Dir Y loop
	if jump and jump_count <= 1:
		vel.y = -JUMP
		jump_count += 1
	if vel.y > 0: anim_loop("fall")
	if vel.y < 0: anim_loop("jump")
	if shoot:
		print("shooot")
		anim_loop("shoot")
		var b = bullet.instance()
		b.Start($Muzzle.global_position,player_side)
		# :global_position: indique la position de :Muzzle: par rapport à la scene racine cad :ScenePrincipale:
		# :position: indique la position de :Muzzle: par rapport à la scene parente cad :Player:
# Print on log
	if DEBUG: print(vel.x, " , ", vel.y, " , ", jump_count)
	
func anim_loop(animation):
	if $Anim.current_animation != animation:
		$Anim.play(animation)
	
