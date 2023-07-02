extends Node
var music = load("res://Audio/main menu.mp3")

func music_main():
	$MainMenu.stream(music)
	$MainMenu.play()
	
func turn_down_volume():
	$MainMenu.volume_db = -12

func reset_volume():
	$MainMenu.volume_db = 0
