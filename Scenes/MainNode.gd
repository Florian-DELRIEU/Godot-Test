extends Node2D
# onready is like in :func _ready:
onready var parent = get_node("Parent") # = $Parent
onready var enfant = get_node("Parent/Enfant") # = $Parent/Enfant
var time = 0
var ci_pos = Vector2(100,100)
var speed = 2
var speed_rotate = 10


func _process(delta):
	time += delta
	$Parent.position.x += speed
	$Parent/Enfant.rotation_degrees += speed_rotate


func ButtonPressed():
	$Parent/Label.text = "Here we go again"
	$Parent.position = ci_pos
