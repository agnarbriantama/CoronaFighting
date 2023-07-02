extends Area2D

#signal dialog_terjadi
export var dialog_key = ""
var area_active = false


func _input(event):
	if area_active and event.is_action_pressed("health"):
		SignalBus.emit_signal("display_dialog", dialog_key)
		
#
#func _on_DialogArea_area_entered(area):
#	area_active = true
#
#
#func _on_DialogArea_area_exited(area):
#	area_active = false
#	queue_free()


func signal_masuk():
	SignalBus.emit_signal("display_dialog", dialog_key)

func _on_DialogArea_body_entered(body):
	if body.name == "karakter1":
		area_active = true
		signal_masuk()
		



func _on_DialogAreaStory_body_exited(body):
	area_active = false
	queue_free()




func _on_DialogAreaLompat_body_exited(body):
	area_active = false
	queue_free()


func _on_DialogAreaTembak_body_exited(body):
	area_active = false
	queue_free()


func _on_DialogAreaFinish_body_exited(body):
	area_active = false
	queue_free()


func _on_DialogAreaLevel2_body_exited(body):
	area_active = false
	queue_free()
	
func _on_DialogAreaMasker_body_exited(body):
	area_active = false
	queue_free()


func _on_DialogAreaVitamin_body_exited(body):
	area_active = false
	queue_free()


func _on_DialogAreaVaksin_body_exited(body):
	area_active = false
	queue_free()


func _on_DialogAreaLevel3_body_exited(body):
	area_active = false
	queue_free()


func _on_DialogArealevel4_body_exited(body):
	area_active = false
	queue_free()
