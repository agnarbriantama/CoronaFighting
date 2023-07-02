extends Position2D


const bullet_velocity = 70.0
onready var Bullet =preload("res://Karakter/Boss_Enemy/peluru_boss1.tscn")
onready var timer = $Cooldown

func _ready():
	pass

func bullet_shoot(direction = 1):
	if not timer.is_stopped():
		return false
	
	timer.start()
	var bullet = Bullet.instance()
		
	if direction == -1:
		bullet.scale.x = 1 if direction > 0 else -1
	bullet.global_position = global_position
		
	if direction == -1:
		direction = 10
	else : direction = -10
		
	bullet.linear_velocity = Vector2(direction * bullet_velocity, 0)
	bullet.set_as_toplevel(true)
	add_child(bullet)
	return true
