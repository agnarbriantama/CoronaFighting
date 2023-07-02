extends Area2D



func _on_Vitamin_body_entered(body):
	if body.name == "karakter1":
#		get_tree().change_scene("res://Level/level1.tscn")
		$AnimationPlayer.play("vit_ambil")
		body.speed()
#		$AudioMasker.stream = audio
#		$AudioMasker.play()

func vit_terambil():
#	emit_signal("masker_taken")
	queue_free()
