extends RigidBody2D

onready var sprite_bullet = $peluruSprite



func _ready() -> void:
	sprite_bullet.play("shooting")

	

func _on_peluru_body_entered(body):
	if body is musuh :
		body.enemy_destroy()
		queue_free()
	
	if body is corona :
		body.enemy_destroy()
		queue_free()
	
	if body is boss1 :
		body.enemy_destroy()
		queue_free()
		
	if body is boss_corona :
		body.enemy_destroy()
		queue_free()

func _on_peluruSprite_animation_finished():
	queue_free()
	
	
