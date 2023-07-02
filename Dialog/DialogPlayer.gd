extends CanvasLayer


export (String, FILE, "*json") var scene_text_file

var scene_text = {}
var selected_text = []
var in_progress = false

onready var tween = $Tween
onready var background = $Background
onready var text_label = $Label
onready var button = $button
var is_paused = false setget set_is_paused

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused

func _ready():
	$button.visible= false
	background.visible = false
	scene_text = load_scene_text()
	SignalBus.connect("display_dialog", self, "on_display_dialog")
	
func load_scene_text():
	var file = File.new()
	if file.file_exists(scene_text_file):
		file.open(scene_text_file, File.READ)
		return parse_json(file.get_as_text())


func show_text():
	text_label.text = selected_text.pop_front()
	$AnimationPlayer.play("show_text")

func next_line():
	if selected_text.size() > 0:
		show_text()
	else:
		finish()

func finish():
	text_label.text = ""
	background.visible = false
	in_progress = false
	$button.visible= false
	get_tree().paused = false

	
func on_display_dialog(dialog_key):
	if in_progress:
#		_on_button_pressed()
		next_line()
	else:
#		self.is_paused = !is_paused
		get_tree().paused = true
		$button.visible= true
		background.visible = true
		in_progress = true
		selected_text = scene_text[dialog_key].duplicate()
		show_text()
		

#func button():
#	$button.get_tree().paused = false

func _on_button_pressed():
#		get_tree().paused = false 
	pass

