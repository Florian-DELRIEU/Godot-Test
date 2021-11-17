extends Node2D
# onready is like in :func _ready:
onready var parent = get_node("Parent") # = $Parent
onready var enfant = get_node("Parent/Enfant") # = $Parent/Enfant
onready var scene_label = get_node("SceneLabel")
var time = 0

export (int) var speed = 2
export (float,0,10,1) var speed_rotate  # selecteur
export (Color,RGB) var color01
export (String) var txt01
export (String,MULTILINE) var txt02
export (PackedScene) var bullet
export (Texture) var texture01
enum Class {GUERRIER,MAGE,VOLEUR}
export (Class) var choix_classes

var pressed = false

func _ready():
	var ci_x = parent.position.x
	var ci_y = parent.position.y
	scene_label.text = "CI : "+str(ci_x)+" , " +str(ci_y)
	
func _process(delta):
	time += delta
	$Parent.position.x += speed
	$Parent/Enfant.rotation_degrees += speed_rotate
	if not pressed: $Parent/ParentLabel.text = str($Parent.position)


func ButtonPressed():
	pressed = true
	$Parent/ParentLabel.text = "Lol i don't care about you :p"
