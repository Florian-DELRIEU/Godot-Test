extends Area2D


enum type_item {PIECE, COEUR, BOMBE}
export (type_item) var item_type
var txt

func _ready(): # peut pas avoir d'argument
	pass
	
func InitializeItem(position,item_type): # Fais spawner un item
	self.position = position
	match item_type:	# Parametre des Items en fonction de leurs types
		type_item.PIECE:
			$Sprite.modulate = Color( 1, 1, 0, 1 )
			txt = "Piece: +1 pts"
		type_item.COEUR:
			$Sprite.modulate = Color( 1, 0, 0, 1 ) 
			txt = "Coeur: +10 PV"
		type_item.BOMBE:
			$Sprite.modulate = Color( 0, 0, 0, 1 ) 
			txt = "Bombe: -50 PV"

func Item_touched(body):  # func connected
	print(txt) 
	if type_item.PIECE: pass # Toujours vraie
	if type_item.COEUR: pass
	if type_item.BOMBE: pass
	print("--------------")
	self.queue_free()  #delete node
