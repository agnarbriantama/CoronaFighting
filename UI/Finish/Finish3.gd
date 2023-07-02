extends Control

func _ready():
	MusicController.play_finish_music()
	$score.text = "Your Score : " + str($"/root/Autoload".point3)
	$AnimationPlayer.play("win")
	Autoload.load_level3()
	$highscore.text = "High Score : " + str(Autoload.highscore_level3)
	$AnimationPlayer.play("win")
	
	if Autoload.point3 > Autoload.highscore_level3 and Autoload.highscore_level3 == 0:
		Autoload.highscore_level3 = Autoload.point3
		Autoload.save_level3()
		Autoload.unlockedLevels += 1
		Autoload.save_level()
		
	elif Autoload.point3 > Autoload.highscore_level3:
		Autoload.highscore_level3 = Autoload.point3
		Autoload.save_level3()

func _on_Loby_pressed():
	$AnimationPlayer.play("win")
	get_tree().change_scene("res://UI/Pilih Level/Levels.tscn")


func _on_mainmenu_pressed():
	$AnimationPlayer.play("win")
	get_tree().change_scene("res://UI/MainMenu/MainMenu.tscn")
