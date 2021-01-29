extends Control

var steps = [] # For now I'm limiting this to one step and two terms
var terms = [] #array of floats

var resetNextPass = false

func _ready():
	pass

var maxLen = 40
var numChars = 0
var numberString:String

func numberPress(number):
	if numChars < maxLen:
		numberString += String(number)
		numChars += 1
		updateText()

#keys: add, sub, div, mult, equals (enter)
func keyPress(key):
	match(key):
		"add":
			resetNextPass = true
			steps.append("+")
			terms.append(float(numberString))
		"sub":
			resetNextPass = true
			steps.append("-")
			terms.append(float(numberString))
		"div":
			resetNextPass = true
			steps.append("/")
			terms.append(float(numberString))
		"mult":
			resetNextPass = true
			steps.append("*")
			terms.append(float(numberString))
		"equals":
			terms.append(float(numberString))
			calculate()
		"backspace":
			if numChars > 0:
				var out = numberString.to_ascii()
				out.remove(out.size() - 1)
				numberString = out.get_string_from_ascii()
				numChars -= 1
		"clear":
			if numberString == "":
				terms.clear()
				steps.clear()
			else:
				numChars = 0
				numberString = ""
		"decimal":
			if numChars < maxLen:
				numberString += "."
				numChars += 1
	updateText()

func updateText():
	$display.text = numberString
	if resetNextPass:
		numChars = 0
		numberString = ""
		resetNextPass = false
	

func calculate():
	resetNextPass = true
	if terms.size() == 1:
		numberString = String(terms[0])
		terms.clear()
		steps.clear()
		return
	elif terms.size() == 0:
		numberString = "0"
		terms.clear()
		steps.clear()
		return
	var output = ""
	print(terms[0])
	print(terms[1])
	match(steps[0]):
		"+":
			output = String(terms[0] + terms[1])
		"-":
			output = String(terms[0] - terms[1])
		"*":
			output = String(terms[0] * terms[1])
		"/":
			if terms[1] == 0:
				output = "Undefined"
			else:
				output = String(terms[0] / terms[1])
	numberString = output
	terms.clear()
	steps.clear()

func go_home():
	get_tree().change_scene("res://main.tscn")
