extends Area2D

signal masker_taken
var audio = ResourceLoader.load("res://Audio/masker-collect.mp3")


func _on_Masker_body_entered(body):
	if body.name == "karakter1":
#		get_tree().change_scene("res://Level/level1.tscn")
		$AnimationPlayer.play("terambil")
		body.plus_health()
		$AudioMasker.stream = audio
		$AudioMasker.play()
	

func mask_terambil():
#	emit_signal("masker_taken")
	queue_free()
	

