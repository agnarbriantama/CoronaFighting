extends Control


func _ready():
	MusicController.play_finish_music()
	$score.text = "Your Score : " + str($"/root/Autoload".point4)
	$AnimationPlayer.play("win")
	Autoload.load_level1() 
	Autoload.load_level2() 
	Autoload.load_level3() 
	Autoload.load_level4() 
	$highscore.text = "High Score : " + str(Autoload.highscore_level4)
	$AnimationPlayer.play("win")
	$total_score.text = "Total HighScore : " + str(Autoload.highscore_level1 + Autoload.highscore_level2 + Autoload.highscore_level3 + Autoload.highscore_level4)
	
	if Autoload.point4 > Autoload.highscore_level4:
		Autoload.highscore_level4 = Autoload.point4
		Autoload.save_level4()



func _on_mainmenu_pressed():
	$AnimationPlayer.play("win")
	get_tree().change_scene("res://UI/MainMenu/MainMenu.tscn")
