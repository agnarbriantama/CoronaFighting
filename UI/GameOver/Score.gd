extends Control


onready var tween = $Tween
var is_paused = false setget set_is_paused
func _ready():
#	$Label.text = "Your Score : " + str($"/root/Autoload".point)
	pass




func _on_MainMenu_pressed():
	self.is_paused = false
	get_tree().change_scene("res://UI/MainMenu/MainMenu.tscn")


func _on_Retry_pressed():
	self.is_paused = false
	get_tree().reload_current_scene()

#func muncul():
#	tween.interpolate_property(self, "rect_position:y", -622, 0, 1, Tween.TRANS_ELASTIC)
#	tween.start()

func muncul():
	tween.interpolate_property(self, "rect_position:y", -600, 0, 1, Tween.TRANS_ELASTIC)
	tween.start()

func _on_level1_karakter_mati():
	self.is_paused = !is_paused
	muncul()
	
func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused




func _on_Level2_karakter_mati():
	self.is_paused = !is_paused
	muncul()


func _on_Level3_karakter_mati():
	self.is_paused = !is_paused
	muncul()


func _on_level4_karakter_mati():
	self.is_paused = !is_paused
	muncul()
