extends Node2D

# onready is like in :func _ready:
onready var parent = get_node("Parent") # = $Parent
onready var enfant = get_node("Parent/Enfant") # = $Parent/Enfant
var time = 0

func _process(delta):
	time += delta
	parent.position.x += 1
	enfant.rotation_degrees += 10


func ButtonPressed():
	$Parent/Label.text = "Yeah i'm ready"
