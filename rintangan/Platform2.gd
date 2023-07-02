extends Node2D

	



func _on_Area2d_body_entered(body):
	if body.name == "karakter1":
		$KinematicBody2D/AnimationPlayer.play("tersentuh")
	
func _die():
	queue_free()
