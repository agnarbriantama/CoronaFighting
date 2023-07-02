extends Area2D

export var dialog_key = ""
var area_active = false

func _ready():
	print(area_active)

func _input(event):
	if area_active and event.is_action_pressed("health"):
		SignalBus.emit_signal("display_dialog", dialog_key)


func signal_masuk():
	SignalBus.emit_signal("display_dialog", dialog_key)

func _on_DialogFinishLevel1_body_entered(body):
	var jumlah_musuh = get_tree().get_nodes_in_group("EnemyGroup").size()
	if jumlah_musuh == 0 and body.name == "karakter1" :
		area_active = true
		signal_masuk()



func _on_DialogFinishLevel1_body_exited(body):
	queue_free()



#func _on_DialogLevel2_body_entered(body):
#	if  body.name == "karakter1" :
#		area_active = true
#		print(area_active)
#		signal_masuk()




func _on_DialogFinish_body_entered(body):
	var jumlah_musuh = get_tree().get_nodes_in_group("EnemyGroup").size()
	if jumlah_musuh == 0 and body.name == "karakter1" :
		area_active = true
		print(area_active)
		signal_masuk()



func _on_DialogFinishLevel4_body_exited(body):
	queue_free()
