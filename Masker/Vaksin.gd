extends Node2D

func _on_Vaksin_body_entered(body):
	if body.name == "karakter1":
#		get_tree().change_scene("res://Level/level1.tscn")
		$AnimationPlayer.play("terambil")
		body.vaksin()
		$AudioVaksin.play()
	
	

func vaksin_terambil():
#	emit_signal("masker_taken")
	queue_free()
	
