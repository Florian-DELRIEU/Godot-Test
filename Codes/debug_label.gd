extends Label

func _process(delta):
	var FPS = 1/delta
	text = ""
	text += "FPS : %.0f" % FPS

