extends Node

#var highscore= highscore_level1 + highscore_level2 + highscore_level3 + highscore_level4
var highscore_level1 = 0
var highscore_level2 = 0
var highscore_level3 = 0
var highscore_level4 = 0
var point1 = 0
var point2 = 0
var point3 = 0
var point4 = 0
var point =  point1 or point2 or point3 or point4
var levels = []
var unlockedLevels = 1
var nickname = ""
var soundVolume = 0  # Volume suara default
	
func _init():
	pass

func setSoundVolume(volume: float):
	soundVolume = volume

func getSoundVolume() -> float:
	return soundVolume



var file = File.new()

func save_level1():
	file.open("user://highscore1.txt" ,File.WRITE)
	file.store_string(str(highscore_level1))
	file.close()
	
func save_level2():
	file.open("user://highscore2.txt", File.WRITE)
	file.store_string(str(highscore_level2))
	file.close()
	
func save_level3():
	file.open("user://highscore3.txt", File.WRITE)
	file.store_string(str(highscore_level3))
	file.close()
	
func save_level4():
	file.open("user://highscore4.txt", File.WRITE)
	file.store_string(str(highscore_level4))
	file.close()
	
#save nickname
func save_nickname():
	var file = File.new()
	file.open("user://nickname.txt" ,File.READ_WRITE)
	file.store_line(str(nickname))
	file.close()

func load_nickname():
#	if file.file_exists("user://nickname.txt"):
		file.open("user://nickname.txt", File.READ)
		var nickname = file.get_as_text()
		file.close()
		
		return nickname
func load_level1():
	if file.file_exists("user://highscore1.txt"):
		file.open("user://highscore1.txt", File.READ)
		highscore_level1 = file.get_as_text().to_int()
		file.close()
	if file.file_exists("user://nickname.txt"):
		file.open("user://nickname.txt", File.READ)
		nickname = file.get_as_text().to_int()
		file.close()
		
func load_level2():
	if file.file_exists("user://highscore2.txt"):
		file.open("user://highscore2.txt", File.READ)
		highscore_level2 = file.get_as_text().to_int()
		file.close()
		
func load_level3():
	if file.file_exists("user://highscore3.txt"):
		file.open("user://highscore3.txt", File.READ)
		highscore_level3 = file.get_as_text().to_int()
		file.close()
		
func load_level4():
	if file.file_exists("user://highscore4.txt"):
		file.open("user://highscore4.txt", File.READ)
		highscore_level4 = file.get_as_text().to_int()
		file.close()


func save_level():
	file.open("user://save_level.txt", File.WRITE)
	file.store_string(str(unlockedLevels))
	file.close()

func load_level():
	if file.file_exists("user://save_level.txt"):
		file.open("user://save_level.txt", File.READ)
		unlockedLevels = file.get_as_text().to_int()
		file.close()
#
#func update_master_vol(vol):
#	AudioServer.set_bus_volume_db(0, vol)#0 adalah urutan audio
##	Save.game_data.master = vol
##	Save.save_data()
#
#func update_music_vol(vol):
#	AudioServer.set_bus_volume_db(2, vol)#0 adalah urutan audio
##	Save.game_data.music = vol
##	Save.save_data()

