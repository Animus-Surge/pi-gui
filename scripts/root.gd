extends Control

const DEBUG = true

onready var appslot = preload("res://prefabs/appslot.tscn")

var focusedTextbox

func initSignals():
	pass

func _ready():
	initSignals()
	loadApps()
	if !DEBUG:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func loadApps():
	var appdir = Directory.new()
	appdir.open("res://data/apps")
	appdir.list_dir_begin(true, true)
	var app = appdir.get_next()
	while app != "":
		var slot = appslot.instance()
		var file = File.new()
		file.open("res://data/apps/" + app, File.READ)
		slot.setDetails(JSON.parse(file.get_as_text()).result)
		$homescreen/apps/layout.add_child(slot)
		app = appdir.get_next()

func close():
	get_tree().quit(0);

var cursorPos = 0

func updateText(key, isalphanumeric):
	if isalphanumeric:
		
		cursorPos += 1
	else:
		match(key):
			"backspace":
				
				
				cursorPos -= 1
			_:
				pass #TODO

func keyboardShow():
	$keyboard/AnimationPlayer.play("Keyboard")

func keyboardHide():
	$keyboard/AnimationPlayer.play_backwards("Keyboard")

func textboxInput(event):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == BUTTON_LEFT:
			keyboardShow()
