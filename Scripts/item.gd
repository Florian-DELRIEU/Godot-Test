extends Area2D

signal loot(valeur)

enum type_item {COINS, COEUR}
export (type_item) var item_type
var txt

func _ready():
	match item_type:
		type_item.COINS:
			$Sprite.modulate = Color(0,1,0)
			txt = "Coins"
		type_item.COEUR:
			$Sprite.modulate = Color(1,0,0)
			txt = "Coeur"
			

func Coins_touched(body):
	self.emit_signal("loot",item_type)
	if type_item.COINS:
		print("add "+txt)
	if type_item.COEUR:
		print("add Coeur")
	queue_free()  #delete node
