extends ColorRect



func _on_BackGame_gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		$".".hide()
		get_tree().paused = false


func _on_MainMenu_gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		get_tree().paused = false
		get_tree().change_scene("res://UI/MainMenu/MainMenu.tscn")


func _on_Quit_gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		get_tree().quit()
