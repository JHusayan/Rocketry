extends Area2D


func _ready():
	#$Meteors.scale(Vector2(5,5)) 
	pass # Replace with function body.

func _physics_process(delta):
	position += Vector2(0,5)

