extends Control


func _ready():
	if not MusicController.mainmenu_music_playing:
		MusicController.play_mainmenu_music()
	Autoload.load_level()
	for level in range($levels.get_child_count()):
		Autoload.levels.append(level+1) # Attach all levels to global.levels array i.e [1,2,3,4, .... number of levels]
	for level in $levels.get_children():
		if str2var(level.name) in range(Autoload.unlockedLevels+1): # Check if the level is already unlocked
			level.disabled = false
			level.connect('pressed', self, 'change_scene',
							[level.name]) # Connect the signal of all enabled buttons 
		else:
			level.disabled = true #Disable all unlocked level buttons
			

	

	
func change_scene(nomer):
	get_tree().change_scene("res://Level/level" + nomer + ".tscn")


func main_menu():
	get_tree().change_scene("res://UI/MainMenu/MainMenu.tscn")
