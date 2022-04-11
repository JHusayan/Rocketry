extends KinematicBody2D


var speed = 500
var motion = Vector2()
var Meteor = preload("res://scenes/Meteors_Node.tscn")
var Stars = preload("res://scenes/Stars_Node.tscn")
var star_score = 0
var on_area = false
	
func _input(event):
	# Detect left/right keystate and only move when pressed.
	motion.x = 0
	if event is InputEventScreenDrag:
		if get_drag_direction(event.relative,8) == Vector2.LEFT:
			motion.x -= 1
		if get_drag_direction(event.relative,8) == Vector2.RIGHT:
			motion.x += 1
	motion = motion.normalized() * speed
	motion = move_and_slide(motion)				

func get_drag_direction(drag, drag_margin):
	var drag_direction = Vector2.ZERO
	
	if drag.x >= -drag_margin and drag.x <= drag_margin:
		if drag.y >= drag_margin:
			drag_direction = Vector2.DOWN
	if drag.x >= -drag_margin and drag.x <= drag_margin:
		if drag.y <= -drag_margin:
			drag_direction = Vector2.UP
	if drag.y >= -drag_margin and drag.y <= drag_margin:
		if drag.x >= drag_margin:
			drag_direction = Vector2.RIGHT
	if drag.y >= -drag_margin and drag.y <= drag_margin:
		if drag.x <= -drag_margin:
			drag_direction = Vector2.LEFT
	
	if on_area == true:
		return drag_direction
				
func _physics_process(delta):
	#get_input()
	get_stars()
	
func Meteor_reset():
	var Meteor_instance = Meteor.instance()
	Meteor_instance.position = Vector2(rand_range(-200,200),-550)
	get_parent().call_deferred("add_child",Meteor_instance)
	
func Stars_reset():
	var Stars_instance = Stars.instance()
	Stars_instance.position = Vector2(rand_range(-210,210),-550)
	get_parent().call_deferred("add_child",Stars_instance)
	
func _on_Resetter_body_entered(body):
	if body.name == "Meteors":
		body.queue_free()
		Meteor_reset()

func get_stars():
	get_parent().get_parent().get_node("HUD_score/Score_Label").text = str(star_score)
	return star_score
	
func _on_Detect_body_entered(body):
	if body.name == "Meteors":
		#get_distance()
		get_tree().change_scene("res://scenes/Game_Over.tscn")
		

func _on_Detect_area_entered(area):
	if area.name == "Stars":
		area.queue_free()
		Stars_reset()
		star_score = star_score + 1
		Main_Script.stars = star_score


func _on_Resetter_area_entered(area):
	if area.name == "Stars":
		area.queue_free()
		Stars_reset()


func _on_TouchScreenButton_pressed():
	on_area = true


func _on_TouchScreenButton_released():
	on_area = false
