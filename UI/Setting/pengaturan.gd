extends Node2D


#mengambil data Audio yang di autoload
func _ready():
	set_process(true)
	$VBoxContainer/Label/Music_Slider.grab_focus()
	$VBoxContainer/Label/Music_Slider.value = AudioServer.get_bus_volume_db(1)
#	$VBoxContainer/Label2/Game_Slider.value = AudioServer.get_bus_volume_db(2)
	if not MusicController.mainmenu_music_playing:
		MusicController.play_mainmenu_music()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Music_Slider_value_changed(value):
	AudioServer.set_bus_volume_db(1, lerp(AudioServer.get_bus_volume_db(1), value, 0.5))
	if value == -30:
		AudioServer.set_bus_mute(1, true)
	else:
		AudioServer.set_bus_mute(1, false)


func _on_Game_Slider_value_changed(value):
	AudioServer.set_bus_volume_db(2, lerp(AudioServer.get_bus_volume_db(2), value, 0.5))
	if value == -30:
		AudioServer.set_bus_mute(2, true)
	else:
		AudioServer.set_bus_mute(2, false)


func _on_Button_pressed():
	get_tree().change_scene("res://UI/MainMenu/MainMenu.tscn")
