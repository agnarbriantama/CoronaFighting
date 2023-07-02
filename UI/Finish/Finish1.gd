extends Control



func _ready():
	
	MusicController.play_finish_music()
	$score.text = "Your Score : " + str($"/root/Autoload".point1)
	$AnimationPlayer.play("win")
	Autoload.load_level1()
	$highscore.text = "High Score : " + str(Autoload.highscore_level1)
	$AnimationPlayer.play("win")
	
	if Autoload.point1 > Autoload.highscore_level1 and Autoload.highscore_level1 == 0:
		Autoload.highscore_level1 = Autoload.point1
		Autoload.save_level1()
		Autoload.unlockedLevels += 1
		Autoload.save_level()
	elif Autoload.point1 > Autoload.highscore_level1:
		Autoload.highscore_level1 = Autoload.point1
		Autoload.save_level1()
	

		
func _on_Loby_pressed():
	$AnimationPlayer.play("win")
	get_tree().change_scene("res://UI/Pilih Level/Levels.tscn")
	
	
func _on_mainmenu_pressed():
	$AnimationPlayer.play("win")
	get_tree().change_scene("res://UI/MainMenu/MainMenu.tscn")
