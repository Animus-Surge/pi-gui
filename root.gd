extends Control

var focusedTextbox

func initSignals():
	pass

func _ready():
	initSignals()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

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
	$AnimationPlayer.play("Keyboard")

func keyboardHide():
	$AnimationPlayer.play_backwards("Keyboard")

func textboxInput(event):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == BUTTON_LEFT:
			keyboardShow()
