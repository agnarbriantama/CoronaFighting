extends Area2D

export var scene_finish : PackedScene



func _on_Portal_body_entered(body):
	var jumlah_musuh = get_tree().get_nodes_in_group("EnemyGroup").size()
	if jumlah_musuh == 0 and body.name == "karakter1" :
		get_tree().change_scene_to(scene_finish)
	


