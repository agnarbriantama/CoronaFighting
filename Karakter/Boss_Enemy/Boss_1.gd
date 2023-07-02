class_name boss1
extends KinematicBody2D



signal coin_taken


enum State {
	WALKING,
	DEAD,
	ATTACK
}

var _state = State.WALKING
var speed = 20.0
var velocity = Vector2.ZERO
var gravity = ProjectSettings.get("physics/2d/default_gravity")
var playerPosition = null
var bullet_shoot = false
onready var health_bar = $EnemyHealth/healthbar

const FLOOR_NORMAL = Vector2.UP

onready var floor_detector_left = $FloorDetectorLeft
onready var floor_detector_right = $FloorDetectorRight
onready var sprite = $AnimatedSprite
onready var Bullet = $AnimatedSprite/gun_boss
onready var area_att_col = $AreaAttack/CollisionShape2D
onready var area_blind = $AreaBlind/CollisionShape2D

func _ready() -> void:
	enemy_walk()


# warning-ignore:unused_argument
func _physics_process(delta: float) -> void:
	if sprite.animation == "Dead":
		self.set_physics_process(false)
		yield(sprite, "animation_finished")
		queue_free()
	
	
	if sprite.scale.x == 1:
		area_att_col.position.x = -494
	else: area_att_col.position.x = 494
	
	if sprite.scale.x == 1:
		area_blind.position.x = 300
	else: area_blind.position.x = -300
	velocity = calculate_move_velocity(velocity)
	velocity.y = move_and_slide(velocity, FLOOR_NORMAL).y
	
	if _state == State.ATTACK:
#		if self.position.x > playerPosition.x:
#			sprite.scale.x = 1  
#		else: sprite.scale.x = -1 
		if bullet_shoot == true and $AnimatedSprite.animation == "Attack":
			Bullet.bullet_shoot(sprite.scale.x)
			
	else :
		if _state != State.DEAD: 
			sprite.scale.x = -1 if velocity.x > 0 else 1 
	
	var animation = get_new_animation()
	
	if animation != sprite.animation and $TimerAnimation.is_stopped():
		if bullet_shoot:
			$TimerAnimation.start()
		sprite.play(animation)
	
	
func calculate_move_velocity(linear_velocity):
	var new_velocity = linear_velocity

	if not floor_detector_left.is_colliding():
		new_velocity.x = speed
	elif not floor_detector_right.is_colliding():
		new_velocity.x = -speed
	
	
	if is_on_wall():
		new_velocity.x *= -1

	return new_velocity


func get_new_animation():
	var animation_new = ""
	if _state == State.WALKING:
		animation_new = "Walk" if abs(velocity.x) > 0 else "Idle"
	elif _state == State.ATTACK:
		animation_new = "Attack"
	else : animation_new = "Dead"
	return animation_new

func enemy_destroy():
	if health_bar.value == 0:
		_state = State.DEAD
		velocity = Vector2.ZERO
		emit_signal("coin_taken")
	else: 
		health_bar.value -= 20
		if health_bar.value <= 0:
			_state = State.DEAD
			velocity = Vector2.ZERO
		else:
			$AnimationPlayer.play("HitAnim")
			$SpawnTimer.start()


func enemy_attack():
	_state = State.ATTACK
	velocity = Vector2.ZERO
	$AnimatedSprite.speed_scale = 2.8
	
	
func enemy_walk():
	_state = State.WALKING
	velocity.y += gravity * get_physics_process_delta_time()
	velocity.x = speed

func _on_AreaAttack_body_entered(body: Node) -> void:
	if body.name == "karakter1":
		playerPosition = body.position
		enemy_attack()
		bullet_shoot = true
		
		

func _on_AreaAttack_body_exited(body: Node) -> void:
	if body.name == "karakter1":
		if _state == State.WALKING or _state == State.ATTACK:
			if _state == State.DEAD:
					enemy_destroy()
			else: 
				if _state != State.DEAD:
					enemy_walk()


func _on_Area2D_body_entered(body):
	if body.name == "karakter1":
		velocity.x *= -speed


func _on_Area2D_body_exited(body):
	if body.name == "karakter1":
		if _state == State.WALKING or _state == State.ATTACK:
			if _state == State.DEAD:
					enemy_destroy()

