class_name corona
extends KinematicBody2D

signal coin_taken

var velocity =  Vector2(200, 200)
var playerPosition = null
var gravity = ProjectSettings.get("physics/2d/default_gravity")
var bullet_shoot = false
onready var sprite = $covidSprite
onready var Bullet = $covidSprite/Bullet
onready var area_att_col = $attackArea/CollisionShape2D
onready var area_blind = $AreaBlind/CollisionShape2D
var speed = 150
onready var health_bar = $EnemyHealth/healthbar
enum State {
	WALKING,
	DEAD,
	ATTACK
}

var _state = State.WALKING

func _ready():
	enemy_walk()
	print("darah monster sekarang : ", health_bar.value )

func _physics_process(delta):
	
	if sprite.animation == "Dead":
		self.set_physics_process(false)
		yield(sprite, "animation_finished")
		queue_free()
	
	if sprite.scale.x == 1:
		area_att_col.position.x = -406
	else: 
		area_att_col.position.x = 406
	
	if sprite.scale.x == 1:
		area_blind.position.x = 430
	else: 
		area_blind.position.x = -430

	
	if _state == State.ATTACK:
#		if self.position.x > playerPosition.x:
#			sprite.scale.x = 1  
#		else: sprite.scale.x = -1 
		if bullet_shoot == true and $covidSprite.animation == "angry":
			Bullet.bullet_shoot(sprite.scale.x)
	else :
		if _state != State.DEAD: 
			sprite.scale.x = -1 if velocity.x > 0 else 1 
#	
	
	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
	
	var animation = get_new_animation()
	
	if animation != sprite.animation and $TimerAnimation.is_stopped():
		if bullet_shoot:
			$TimerAnimation.start()
		sprite.play(animation)
	
	
func get_new_animation():
	var animation_new = ""
	if _state == State.WALKING:
		animation_new = "walk" if abs(velocity.x) > 0 else "idle" 
	elif _state == State.ATTACK:
		animation_new = "angry"
	else : animation_new = "Dead"
	return animation_new

func enemy_attack():
	_state = State.ATTACK
	velocity = Vector2.ZERO
	$covidSprite.speed_scale = 2.8



func enemy_destroy():
	if health_bar.value == 0:
		_state = State.DEAD
		velocity = Vector2.ZERO
		$AnimationPlayer.play("coin")
		emit_signal("coin_taken")
	else: 
		health_bar.value -= 30
		print("darah mosnter berkurang menjadi : " , health_bar.value)
		if health_bar.value <= 0:
			_state = State.DEAD
			velocity = Vector2.ZERO
			$AnimationPlayer.play("coin")
			emit_signal("coin_taken")
		else:
			$AnimationPlayer.play("Hit")
			$SpawnTimer.start()



func enemy_walk():
	_state = State.WALKING
	randomize()
	velocity.x = [-1,1][randi() % 2]
	velocity.y = [-0.7,0.7][randi() % 2]
	

func _on_attack_kiri_body_entered(body):
	if body.name == "karakter1":
		playerPosition = body.position
		enemy_attack()
		bullet_shoot = true

func _on_attackArea_body_exited(body):
	if body.name == "karakter1":
		if _state == State.WALKING or _state == State.ATTACK:
			if _state == State.DEAD:
					enemy_destroy()
			else: 
				if _state != State.DEAD:
					 enemy_walk()


func _on_AreaBlind_body_entered(body):
	if body.name == "karakter1":
		velocity.x *= -1 
		


func _on_AreaBlind_body_exited(body):
	if body.name == "karakter1":
		if _state == State.WALKING or _state == State.ATTACK:
			if _state == State.DEAD:
					enemy_destroy()
