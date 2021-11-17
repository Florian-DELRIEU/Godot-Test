extends Node2D
var player_input_x
var player_input_y
var txt = ""

func _process(delta):
	player_input_x = $Player.dirX
	player_input_y = $Player.dirY
	debug_print()

func debug_print():
	txt = """DEBUG LABEL
	Player input: 		{} , {}
	Player position: 	{} , {}
	""".format([
		player_input_x,player_input_y,
		$Player.position.x,$Player.position.y
		],"{}")
	$SceneLabel.text = txt
