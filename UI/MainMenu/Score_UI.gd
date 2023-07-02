extends Label

func _ready():
	$CanvasLayer/Label.text = "Your Score : " + str($"/root/Autoload".point)
