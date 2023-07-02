extends RigidBody2D

onready var sprite_bullet = $SpriteBullet
	
func _ready() -> void:
	sprite_bullet.play("Destroy")
	$bullet.play()


func _on_SpriteBullet_animation_finished():
	queue_free()


func _on_Peluru_body_entered(body):
	if body.name == "karakter1":
#		get_tree().change_scene("res://Level/level1.tscn")
		body.die()
		queue_free()
	elif body.name == "Bullet":
		queue_free()
		body.queue_free()
