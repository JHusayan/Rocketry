extends Node

var screen_size
var stars = 0
var title
var button
var Scene_Fader
	
func _ready():
#	Scene_Fader = find_node("ColorRect")
	screen_size = get_viewport().size
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

	
func var_reset():
	stars = 0


func _on_Exit_pressed():
	get_tree().quit()

func _on_Play_pressed():
#	Scene_Fader.Fade_out()
#	yield(Scene_Fader,'finished')
	get_tree().change_scene("res://scenes/World_Node.tscn")
