class_name Player
extends KinematicBody2D

#onready var screen_shaker = get_node("Cam/shaker")
onready var gun = $mainKarakter/gun
onready var peluru = preload("res://Karakter/peluru/peluru.tscn")
#export var speed = 100 
var movement = Vector2.ZERO
const gravity = 10
const lompat = -250
const max_jump = 2
var jump_count = 0
onready var karakter = $mainKarakter
onready var health_bar = $PlayerBar/PlayerBar/BGPlayer/HealthBar
var audio_jump = ResourceLoader.load("res://Audio/Jump.wav")
var audio_shoot = ResourceLoader.load("res://Audio/gun sound.wav")
var audio_gameover = ResourceLoader.load("res://Audio/game over.wav")
var speed_normal = 150
var speed = speed_normal
var jump_speed = -200
var sedang_terluka = false
var fast_speed = false
var low_speed =50
var high_speed = 400


func _physics_process(delta):
	if not is_on_floor():
		 movement.y += gravity
	else:
		movement.y = 0
		jump_count = 0
	
	if not sedang_terluka and not fast_speed:
		movement.x = (Input.get_action_strength("kanan") - Input.get_action_strength("kiri"))*speed #movement kekanan dan ke kiri
#

	
	if(Input.is_action_just_pressed("Jump")) and (is_on_floor() or (jump_count < max_jump)):
		
		$KarakterSound.stream = audio_jump
		$KarakterSound.play()
		
		movement.y = lompat
		jump_count += 1

		
	
	if(is_on_ceiling()):
#		movement.y = 0
		pass
		#print("atap")
	
	if(is_on_wall()):
		pass
	


	
	

	
	
	move_and_slide_with_snap(movement, Vector2(0,2), Vector2(0,-1), false, 4, PI/4, false) # setelah nabrak permukaan bregerak 
	
#	if(get_slide_count() >0) :
#		for i in get_slide_count():
#			var benda =  get_slide_collision(i)
#			if (benda.collider is RigidBody2D) :
#				benda.collider.apply_central_impulse(movement)
	


	if movement.x != 0:
		$mainKarakter.scale.x = 0.592 if movement.x > 0 else -0.592
		
		
	var is_shooting = false
	
	if Input.is_action_just_pressed("shoot") :
		is_shooting =  gun.shoot($mainKarakter.scale.x)
		$KarakterSound.stream = audio_shoot
		$KarakterSound.play()


	var animation = setAnimation(is_shooting)
	
	if $mainKarakter.animation != animation and $TimerAnimation.is_stopped():
		if is_shooting:
			$TimerAnimation.start()
		$mainKarakter.play(animation)

func setAnimation(is_shoot):
	var new_animation = ""
	
	if is_on_floor():
		new_animation = "walk" if abs(movement.x) > 1.4 else "idle"
	else:
		if movement.y < 0 : new_animation = "jump"
		 
	if is_shoot:
		if movement.y != 0 and movement.x != 0:
				new_animation = "shooting"
		elif movement.x != 0:   
			new_animation = "walk"
		elif movement.y != 0:
			new_animation = "shooting" 
		else : new_animation = "shooting"
	
	return new_animation
#
#	$mainKarakter.flip_h = false
#	if movement.x < 0:
#		$mainKarakter.flip_h = true
	

		
	
	

func die():
	sedang_terluka = true
	health_bar.value -= 20
	
	movement.x = (Input.get_action_strength("kanan") - Input.get_action_strength("kiri"))*low_speed
	$AnimationPlayer.play("HitAnim")
	$SpawnTimer.start()
	yield(get_tree().create_timer(0.3), "timeout")
	if health_bar.value <= 0:
		$TimerAnimation.start()
		$mainKarakter.play("Dead")
		get_parent().emit_signal("karakter_mati")
				
	else:
		sedang_terluka = false
		
			
		
func boss_kill():
	sedang_terluka = true
	health_bar.value -= 30
	
	movement.x = (Input.get_action_strength("kanan") - Input.get_action_strength("kiri"))*low_speed
	$AnimationPlayer.play("HitBoss")
	$SpawnTimer.start()
	yield(get_tree().create_timer(0.3), "timeout")
	if health_bar.value <= 0:
		$TimerAnimation.start()
		$mainKarakter.play("Dead")
		get_parent().emit_signal("karakter_mati")
				
	else:
		sedang_terluka = false
	
func jurang():
	health_bar.value -= 100
	$KarakterSound.stream = audio_gameover
	$KarakterSound.play()
	get_parent().emit_signal("karakter_mati")
			
func plus_health():
	health_bar.value +=20
	$AnimationPlayer.play("heal")
	$SpawnTimer.start()
	
func vaksin():
	health_bar.value +=100
	$AnimationPlayer.play("heal")
	$SpawnTimer.start()

func speed():
#	fast_speed = true
#	if( Input.get_action_strength("kanan")):
#		movement.x = high_speed
#
#	if(Input.get_action_strength("kiri")):
#		movement.x = -high_speed
#
#	yield(get_tree().create_timer(3), "timeout")
#	fast_speed = false
	
	speed = high_speed
	$Timer.start()
	
	

func _on_Timer_timeout():
	speed = speed_normal
