extends Node2D

signal karakter_mati
var point2 = 0
var masker = 0


func _ready():
	MusicController.play_game_music()
#Menambahkan point

	var CoinGroup
	CoinGroup = $CoinGroup.get_children()
	$GUI.update_point(point2)
#	$GameOver/Score.update_point(point)
	for coin in CoinGroup:
		coin.connect("coin_taken",self, "_tambah_point")
		
		
	var kump_musuh 
	kump_musuh = $kump_musuh.get_children()
	$GUI.update_point(point2)
#	$GameOver/Score.update_point(point)
	for musuh in kump_musuh:
		musuh.connect("coin_taken",self, "_point_kill_musuh")
	
	var kump_boss
	kump_boss = $kump_boss.get_children()
	$GUI.update_point(point2)
	for boss in kump_boss:
		boss.connect("coin_taken",self, "_point_kill_boss")
	
#	Menambahkan masker

#	var MaskGroup
#	MaskGroup = $MaskGroup.get_children()
#
#
#	for masker in MaskGroup:
#		masker.connect("masker_taken",self, "_tambah_masker")

			
		
		
#
func _tambah_point():
	point2 += 1
	get_node("/root/Autoload").point = point2
	$GUI.update_point(point2)
#	$GameOver/Score.update_point(point)
	
func _point_kill_musuh():
	point2 += 40
	get_node("/root/Autoload").point2 = point2
#	Autoload.save()
	$GUI.update_point(point2)

func _point_kill_boss():
	point2 += 50
	get_node("/root/Autoload").point2 = point2
#	Autoload.save()
	$GUI.update_point(point2)

#func _tambah_masker():
#	masker += 1
#	print(masker)

#func _input(event: InputEvent) -> void:
#	if event.is_action_pressed("pause"):
#		var pause = get_node("PauseLayer/Pause")
#		pause.show()

		
		


func _on_zonajatuh(body):
	if body.name == 'karakter1':
		get_tree().change_scene("res://Level/level2.tscn")
		
		

