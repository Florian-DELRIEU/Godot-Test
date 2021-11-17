extends Node2D
# onready is like in :func _ready:
onready var parent = get_node("Parent") # = $Parent
onready var scene_label = get_node("SceneLabel")
var time = 0
export (int) var speed = 2
var button_pressed = false

func _ready():
	var ci_x = parent.position.x
	var ci_y = parent.position.y
	scene_label.text = "CI : "+str(ci_x)+" , " +str(ci_y)
	
func _process(delta):
	time += delta
	if button_pressed: $Parent.position.x += speed
	if not button_pressed: $Parent/ParentLabel.text = str($Parent.position)


func ButtonPressed():
	button_pressed = not button_pressed
	$Parent/ParentLabel.text = "GOOOOO !"
