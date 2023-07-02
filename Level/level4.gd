extends Node2D

signal karakter_mati
signal karakter_finish
var point4 = 0
var masker = 0



	
func _ready():
	MusicController.play_game_music()
#Menambahkan point

	var CoinGroup
	CoinGroup = $CoinGroup.get_children()
	$GUI.update_point(point4)
	for coin in CoinGroup:
		coin.connect("coin_taken",self, "_tambah_point")
#	Autoload.save()
		
		
	var kump_musuh 
	kump_musuh = $kump_musuh.get_children()
	$GUI.update_point(point4)
	for musuh in kump_musuh:
		musuh.connect("coin_taken",self, "_point_kill_musuh")
#	Autoload.save()
	var kump_boss
	kump_boss = $kump_boss.get_children()
	$GUI.update_point(point4)
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
	point4 += 1
	get_node("/root/Autoload").point4 = point4
#	Autoload.save()
	$GUI.update_point(point4)
	

func _point_kill_musuh():
	point4 += 40
	get_node("/root/Autoload").point4 = point4
#	Autoload.save()
	$GUI.update_point(point4)

func _point_kill_boss():
	point4 += 40
	get_node("/root/Autoload").point4 = point4
#	Autoload.save()
	$GUI.update_point(point4)

#func _tambah_masker():
#	masker += 1
#	print(masker)

#func _input(event: InputEvent) -> void:
#	if event.is_action_pressed("pause"):
#		var pause = get_node("PauseLayer/Pause")
#		pause.show()



		
		
