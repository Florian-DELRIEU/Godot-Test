extends Node2D
var player_input_x
var player_input_y
var txt = ""
var DEBUG_HUD = true
	
# Charge la scene de :item:
onready var Item = preload("res://Scenes/item.tscn")
onready var screen_size = get_viewport().size

func _ready():
	SpawnItem(5)

func _process(delta):
	player_input_x = $Player.dirX
	player_input_y = $Player.dirY
	debug_print()


func SpawnItem(nb_items):
	randomize()  # Re initialise la graine random
	for x in nb_items:
		var x_pose = rand_range(-screen_size.x/2,screen_size.x/2)
		var y_pose = rand_range(-screen_size.y/2,screen_size.y/2)
		var type = randi() % 3
		print(type)
		var i = Item.instance() # cree instance de item (basique)
		i.InitializeItem(Vector2(x_pose,y_pose),type) # positionne et attribut le type a :item:
		self.add_child(i) #ajoute enfant :i: à self (i rentre dans l'arborescence de :MainNode:)

##################################

func debug_print():
	txt = """DEBUG LABEL
	Player input: 		{} , {}
	Player position: 	{} , {}
	Slider:				{}
	Rotating angle: 	{} °
	
	------ screen_size -----
	Size = {}
	x = {}
	y = {}
	
	------ Kinetic Ball -----
	Position: 			{}
	Speed: 				{} px/s
	Bounce:				{}
	Damp:				{}
	friction:			{}
	""".format([
		player_input_x,player_input_y,
		$Player.position.x,$Player.position.y,
		$Camera2D/SpeedSlider.value,
		$Player/Shell.angle,
		
		screen_size,
		screen_size.x,
		screen_size.y,
		
		$Kineticball.position,
		$Kineticball.linear_velocity.length(),
		$Kineticball.bounce,
		$Kineticball.linear_damp,
		$Kineticball.friction
		],"{}")
	if DEBUG_HUD: $Camera2D/DebugHUD.text = txt
	else: 		  $Camera2D/DebugHUD.text = ""

func InitialPose_button():
	$Player.position.x = 0
	$Player.position.y = 0

func Debug_pressed():
	DEBUG_HUD = not DEBUG_HUD

func SpawnItem_pressed():
	SpawnItem(5)
