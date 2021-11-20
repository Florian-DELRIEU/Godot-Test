extends Area2D

signal loot(valeur) # add new signal

enum type_item {PIECE, COEUR, BOMBE}
export (type_item) var item_type
var txt

func _ready(): # peut pas avoir d'argument
	pass
	
func Start(position,item_type):
	self.position = position
	self.connect("loot",get_parent(),"recup_loot") # connect le signal
	match item_type:	# Parametre des Items
		type_item.PIECE:
			$Sprite.modulate = Color( 1, 1, 0, 1 )
			txt = "Piece"
		type_item.COEUR:
			$Sprite.modulate = Color( 1, 0, 0, 1 ) 
			txt = "Coeur"
		type_item.BOMBE:
			$Sprite.modulate = Color( 0, 0, 0, 0 ) 
			txt = "Bombe"

func Coins_touched(body):  # func connected
	self.emit_signal("loot",item_type) # valeur = item_type
	print("add "+txt) 
	if type_item.PIECE: pass
	if type_item.COEUR: pass
	if type_item.BOMBE: pass
	self.queue_free()  #delete node
