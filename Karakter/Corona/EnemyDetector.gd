extends RayCast2D

var target : Player = null

func _physics_process(delta):
	if is_colliding():
		if get_collider() is Player:
			target = get_collider()
