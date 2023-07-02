extends Control

#var audio_menu = ResourceLoader.load("res://Audio/main menu.mp3")
#var audio_button = ResourceLoader.load("res://Audio/click.wav")
func _ready():
#	$AudioMainMenu.stream = audio_menu
	if not MusicController.mainmenu_music_playing:
		MusicController.play_mainmenu_music()
#	$AudioMainMenu.play()
#	$Setting.visible = false
#	Save.load_data()
	
#	$CanvasLayer.visible= true

	
#func suara(value):
#	Setting._on_HSlider_value_changed(value)
#	hide()

func _on_Play_Game_pressed():
#	$AudioButton.stream = audio_button
#	$AudioButton.play()
#	get_tree().change_scene("res://UI/Pilih Level/Levels.tscn")
#	pilih_level()
	get_tree().change_scene("res://UI/Pilih Level/Levels.tscn")


func _on_Quit_pressed():
#	$AudioButton.stream = audio_button
#	$AudioButton.play()
	get_tree().quit()


func _on_Settings_pressed():
#	$AudioButton.stream = audio_button
#	$AudioButton.play()
	get_tree().change_scene("res://UI/Setting/pengaturan.tscn")
#	setting()

#
func _on_Play_Game_mouse_entered():
#	$AudioButton.stream = audio_button
	$AudioButton.play()


func _on_Settings_mouse_entered():
#	$AudioButton.stream = audio_button
	$AudioButton.play()

func _on_Quit_mouse_entered():
#	$AudioButton.stream = audio_button
	$AudioButton.play()

func pilih_level():
	$levels.visible = true
