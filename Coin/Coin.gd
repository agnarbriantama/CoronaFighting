extends Area2D

signal coin_taken
var audio = ResourceLoader.load("res://Audio/coin collect.ogg")

func _on_Coin_body_entered(body):
	$AnimationPlayer.play("taken")
	$AudioCoin.stream = audio
	$AudioCoin.play()

func _die():
	emit_signal("coin_taken")
	queue_free()


