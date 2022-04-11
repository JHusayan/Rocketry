extends ColorRect

signal finished

func Fade_out():
	$AnimationPlayer.play("Fade_In")


func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("finished")


