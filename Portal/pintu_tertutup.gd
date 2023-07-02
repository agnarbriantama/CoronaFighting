extends Area2D
signal finish


func _on_pintu_tertutup_body_entered(body):
	var jumlah_musuh = get_tree().get_nodes_in_group("EnemyGroup").size()
	if jumlah_musuh == 0 and body.name == "karakter1" :
		emit_signal("finish")
		print("masuk")
		queue_free()



