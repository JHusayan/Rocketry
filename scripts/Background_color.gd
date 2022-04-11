extends Sprite

#const Colors = [
#"#5d275d",
#"#b13e53",
#"#ef7d57",
#"#ffcd75",
#"#38b764",
#"#257179",
#"#29366f",
#"#3b5dc9",
#"#41a6f6",
#"#566c86",
#"#333c57"]

#func change_color():
#	for c in Colors:
#		randomize()
#		modulate = Colors[randi()% Colors.size()]
#		yield(get_tree().create_timer(6.0),"timeout")


	
func _ready():
	#modulate = Color("#090e0d")
	#modulate = Color("#16e0bd")
	modulate = Color("#212b38")
	#change_color()


		

