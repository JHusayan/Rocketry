extends Node

var current_score	
func _ready():
	current_score = Main_Script.stars
	$HUD/Score_Value.text = str("",current_score)
	

func title_color():
	$HUD/Title.font_color

func _on_Button_pressed():
	get_tree().change_scene("res://scenes/World_Node.tscn")
	Main_Script.var_reset()

func _on_Quit_pressed():
	get_tree().quit()
	pass
	
