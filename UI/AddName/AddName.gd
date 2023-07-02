extends Control


func _ready():
	$Panel/Label.text = Autoload.load_nickname()

func save_button():
#	Autoload.nickname = get_node("Panel/LineEdit").get_text()
	Autoload.nickname =  str($Panel/LineEdit.text)
	Autoload.save_nickname()
#	queue_free()
#	get_node("Panel/Label").set_text(Autoload.nickname)

