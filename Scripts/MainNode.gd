extends Node2D
var player_input_x
var player_input_y
var txt = ""
var DEBUG_HUD = true

func _process(delta):
	player_input_x = $Player.dirX
	player_input_y = $Player.dirY
	debug_print()

func debug_print():
	txt = """DEBUG LABEL
	Player input: 		{} , {}
	Player position: 	{} , {}
	Slider:				{}
	""".format([
		player_input_x,player_input_y,
		$Player.position.x,$Player.position.y,
		$SpeedSlider.value
		],"{}")
	if DEBUG_HUD: $Camera2D/DebugHUD.text = txt
	else: 		  $Camera2D/DebugHUD.text = ""


func InitialPose_button():
	$Player.position.x = 0
	$Player.position.y = 0


func Debug_pressed():
	DEBUG_HUD = not DEBUG_HUD
