extends CanvasLayer

func _ready():
	pass


func _on_Pause_pressed():
	#$Pause/Background.visible = !$Pause/Background.visible
	get_tree().paused = !get_tree().paused

