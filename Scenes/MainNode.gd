extends Node2D

# onready is like in :func _ready:
onready var parent = get_node("Parent")
onready var enfant = get_node("Parent/Enfant")

func _process(delta):
	parent.position.x += 1
	enfant.rotation_degrees += 10
