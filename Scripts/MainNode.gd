extends Node2D
var player_input_x
var player_input_y
var txt = ""
var DEBUG_HUD = true
	
# Charge la scene de l'item
onready var item = preload("res://Scenes/item.tscn")

func _ready():
	for x in 5: SpawnItem()

func _process(delta):
	player_input_x = $Player.dirX
	player_input_y = $Player.dirY
	debug_print()

func recup_loot(valeur):
	print("J'ai récupérer l'item " + str(valeur)) 

func SpawnItem():
	var x_pose = rand_range(-600,600)
	var y_pose = rand_range(-400,400)
	var type = int(rand_range(0,1))
	var i = item.instance() # cree instance de item
	i.Start(Vector2(x_pose,y_pose),1)
	self.add_child(i) #ajoute enfant :i: à self

##################################

func debug_print():
	txt = """DEBUG LABEL
	Player input: 		{} , {}
	Player position: 	{} , {}
	Slider:				{}
	Rotating angle: 	{} °
	
	------ Kinetic Ball -----
	Position: 			{}
	Speed: 				{} px/s
	Bounce:				{}
	Damp:				{}
	friction:			{}
	""".format([
		player_input_x,player_input_y,
		$Player.position.x,$Player.position.y,
		$SpeedSlider.value,
		$Player/Shell.angle,
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

