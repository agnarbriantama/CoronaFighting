extends Control

func _ready():
	MusicController.play_finish_music()
	$score.text = "Your Score : " + str($"/root/Autoload".point2)
	$AnimationPlayer.play("win")
	Autoload.load_level2()
	$highscore.text = "High Score : " + str(Autoload.highscore_level2)
	$AnimationPlayer.play("win")
	
	if Autoload.point2 > Autoload.highscore_level2 and Autoload.highscore_level2 == 0 :
		Autoload.highscore_level2 = Autoload.point2
		Autoload.save_level2()
		Autoload.unlockedLevels += 1
		Autoload.save_level()
	elif Autoload.point2 > Autoload.highscore_level2:
		Autoload.highscore_level2 = Autoload.point2
		Autoload.save_level1()
	
func _on_Loby_pressed():
	$AnimationPlayer.play("win")
	get_tree().change_scene("res://UI/Pilih Level/Levels.tscn")


func _on_mainmenu_pressed():
	$AnimationPlayer.play("win")
	get_tree().change_scene("res://UI/MainMenu/MainMenu.tscn")
