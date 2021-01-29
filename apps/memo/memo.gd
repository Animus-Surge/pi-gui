extends Panel

onready var writeNode = $view

func updateText(key, alphachar):
	if alphachar:
		writeNode.text += key
	else:
		match(key):
			"return":
				writeNode.text += "\n"
			"backspace":
				var text = writeNode.text.to_ascii()
				text.remove(text.size() - 1)
				writeNode.text = text.get_string_from_ascii()

func onTextboxFocus(event):
	if event is InputEventMouseButton:
		$keyboard.showKeyboard()

func _ready():
	pass

func go_home():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://main.tscn")
