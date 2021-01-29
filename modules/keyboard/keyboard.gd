extends Panel

func initializeSignals():
	#modifiers
# warning-ignore:return_value_discarded
	$altL.connect("toggled", self, "altToggle")
# warning-ignore:return_value_discarded
	$altR.connect("toggled", self, "altToggle")
	
# warning-ignore:return_value_discarded
	$ctrlL.connect("toggled", self, "ctrlToggle")
# warning-ignore:return_value_discarded
	$ctrlR.connect("toggled", self, "ctrlToggle")
	
# warning-ignore:return_value_discarded
	$shiftL.connect("toggled", self, "shiftToggle")
# warning-ignore:return_value_discarded
	$shiftR.connect("toggled", self, "shiftToggle")
	
# warning-ignore:return_value_discarded
	$function.connect("toggled", self, "fnToggle")
# warning-ignore:return_value_discarded
	$caps.connect("toggled", self, "capsToggle")
	
	#numbers
# warning-ignore:return_value_discarded
	$"1".connect("pressed", self, "a1")
# warning-ignore:return_value_discarded
	$"2".connect("pressed", self, "a2")
# warning-ignore:return_value_discarded
	$"3".connect("pressed", self, "a3")
# warning-ignore:return_value_discarded
	$"4".connect("pressed", self, "a4")
# warning-ignore:return_value_discarded
	$"5".connect("pressed", self, "a5")
# warning-ignore:return_value_discarded
	$"6".connect("pressed", self, "a6")
# warning-ignore:return_value_discarded
	$"7".connect("pressed", self, "a7")
# warning-ignore:return_value_discarded
	$"8".connect("pressed", self, "a8")
# warning-ignore:return_value_discarded
	$"9".connect("pressed", self, "a9")
# warning-ignore:return_value_discarded
	$"0".connect("pressed", self, "a0")
	
	#letters
# warning-ignore:return_value_discarded
	$Q.connect("pressed", self, "Q")
# warning-ignore:return_value_discarded
	$W.connect("pressed", self, "W")
# warning-ignore:return_value_discarded
	$E.connect("pressed", self, "E")
# warning-ignore:return_value_discarded
	$R.connect("pressed", self, "R")
# warning-ignore:return_value_discarded
	$T.connect("pressed", self, "T")
# warning-ignore:return_value_discarded
	$Y.connect("pressed", self, "Y")
# warning-ignore:return_value_discarded
	$U.connect("pressed", self, "U")
# warning-ignore:return_value_discarded
	$I.connect("pressed", self, "I")
# warning-ignore:return_value_discarded
	$O.connect("pressed", self, "O")
# warning-ignore:return_value_discarded
	$P.connect("pressed", self, "P")
	
# warning-ignore:return_value_discarded
	$A.connect("pressed", self, "A")
# warning-ignore:return_value_discarded
	$S.connect("pressed", self, "S")
# warning-ignore:return_value_discarded
	$D.connect("pressed", self, "D")
# warning-ignore:return_value_discarded
	$F.connect("pressed", self, "F")
# warning-ignore:return_value_discarded
	$G.connect("pressed", self, "G")
# warning-ignore:return_value_discarded
	$H.connect("pressed", self, "H")
# warning-ignore:return_value_discarded
	$J.connect("pressed", self, "J")
# warning-ignore:return_value_discarded
	$K.connect("pressed", self, "K")
# warning-ignore:return_value_discarded
	$L.connect("pressed", self, "L")
	
# warning-ignore:return_value_discarded
	$Z.connect("pressed", self, "Z")
# warning-ignore:return_value_discarded
	$X.connect("pressed", self, "X")
# warning-ignore:return_value_discarded
	$C.connect("pressed", self, "C")
# warning-ignore:return_value_discarded
	$V.connect("pressed", self, "V")
# warning-ignore:return_value_discarded
	$B.connect("pressed", self, "B")
# warning-ignore:return_value_discarded
	$N.connect("pressed", self, "N")
# warning-ignore:return_value_discarded
	$M.connect("pressed", self, "M")
	
	#symbols
# warning-ignore:return_value_discarded
	$GRAVE.connect("pressed", self, "GRAVE")
# warning-ignore:return_value_discarded
	$MINUS.connect("pressed", self, "MINUS")
# warning-ignore:return_value_discarded
	$EQUALS.connect("pressed", self, "EQUALS")
# warning-ignore:return_value_discarded
	$LBRACKET.connect("pressed", self, "LBRACKET")
# warning-ignore:return_value_discarded
	$RBRACKET.connect("pressed", self, "RBRACKET")
# warning-ignore:return_value_discarded
	$BSLASH.connect("pressed", self, "BSLASH")
# warning-ignore:return_value_discarded
	$SEMI.connect("pressed", self, "SEMI")
# warning-ignore:return_value_discarded
	$APOSTROPHE.connect("pressed", self, "APOSTROPHE")
# warning-ignore:return_value_discarded
	$COMMA.connect("pressed", self, "COMMA")
# warning-ignore:return_value_discarded
	$PERIOD.connect("pressed", self, "PERIOD")
# warning-ignore:return_value_discarded
	$FSLASH.connect("pressed", self, "FSLASH")
	
# warning-ignore:return_value_discarded
	$SPACE.connect("pressed", self, "space")
# warning-ignore:return_value_discarded
	$backspace.connect("pressed", self, "backspace")

func showKeyboard():
	$AnimationPlayer.play("Keyboard")

func hideKeyboard():
	$AnimationPlayer.play_backwards("Keyboard")

func alphakey(character, alt_character):
	
	if shiftOn:
		get_parent().updateText(alt_character, true)
	else:
		get_parent().updateText(character, true)
	
	shiftOn = false
	altOn = false
	ctrlOn = false
	
	$shiftL.pressed = false
	$shiftR.pressed = false
	
	$ctrlL.pressed = false
	$ctrlR.pressed = false
	
	$altL.pressed = false
	$altR.pressed = false

func key(keyname):
	get_parent().updateText(keyname, false)

func _ready():
	initializeSignals()
	set_process(true)

#Modifier keys - TODO: separate out the sides so they can do individual things (later)

var shiftOn := false
var ctrlOn := false
var altOn := false
var fnOn := false
var capsOn := false

func shiftToggle(toggled):
	shiftOn = toggled
	
	$shiftL.pressed = toggled
	$shiftR.pressed = toggled

func ctrlToggle(toggled):
	ctrlOn = toggled
	
	$ctrlL.pressed = toggled
	$ctrlR.pressed = toggled

func altToggle(toggled):
	altOn = toggled
	
	$altL.pressed = toggled
	$altR.pressed = toggled

func fnToggle(toggled):
	fnOn = toggled

func capsToggle(toggled):
	capsOn = toggled
	print(capsOn)

#Alphanumeric keys

func Q():
	alphakey("q", "Q")

func W():
	alphakey("w", "W")

func E():
	alphakey("e", "E")

func R():
	alphakey("r", "R")

func T():
	alphakey("t", "T")

func Y():
	alphakey("y", "Y")

func U():
	alphakey("u", "U")

func I():
	alphakey("i", "I")

func O():
	alphakey("o", "O")

func P():
	alphakey("p", "P")

func A():
	alphakey("a", "A")

func S():
	alphakey("s", "S")

func D():
	alphakey("d", "D")

func F():
	alphakey("f", "F")

func G():
	alphakey("g", "G")

func H():
	alphakey("h", "H")

func J():
	alphakey("j", "J")

func K():
	alphakey("k", "K")

func L():
	alphakey("l", "L")

func Z():
	alphakey("z", "Z")

func X():
	alphakey("x", "X")

func C():
	alphakey("c", "C")

func V():
	alphakey("v", "V")

func B():
	alphakey("b", "B")

func N():
	alphakey("n", "N")

func M():
	alphakey("m", "M")

func a1():
	alphakey("1", "!")

func a2():
	alphakey("2", "@")

func a3():
	alphakey("3", "#")

func a4():
	alphakey("4", "$")

func a5():
	alphakey("5", "%")

func a6():
	alphakey("6", "^")

func a7():
	alphakey("7", "&")

func a8():
	alphakey("8", "*")

func a9():
	alphakey("9", "(")

func a0():
	alphakey("0", ")")

#symbol keys

func GRAVE():
	alphakey("`", "~")

func MINUS():
	alphakey("-", "_")

func EQUALS():
	alphakey("=", "+")

func LBRACKET():
	alphakey("[", "{")

func RBRACKET():
	alphakey("]", "}")

func BSLASH():
	alphakey("\\", "|")

func SEMI():
	alphakey(";", ":")

func APOSTROPHE():
	alphakey("'", "\"")

func COMMA():
	alphakey(",", "<")

func PERIOD():
	alphakey(".", ">")

func FSLASH():
	alphakey("/", "?")

#action keys

func tab():
	alphakey("    ", "    ")

func enter():
	key("return")

func backspace():
	key("backspace")

func space():
	alphakey(" ", " ")

#key label processing
func _process(_delta):
	if capsOn or shiftOn:
		print(capsOn)
		$Q.text = "Q"
		$W.text = "W"
		$E.text = "E"
		$R.text = "R"
		$T.text = "T"
		$Y.text = "Y"
		$U.text = "U"
		$I.text = "I"
		$O.text = "O"
		$P.text = "P"
		
		$A.text = "A"
		$S.text = "S"
		$D.text = "D"
		$F.text = "F"
		$G.text = "G"
		$H.text = "H"
		$J.text = "J"
		$K.text = "K"
		$L.text = "L"
		
		$Z.text = "Z"
		$X.text = "X"
		$C.text = "C"
		$V.text = "V"
		$B.text = "B"
		$N.text = "N"
		$M.text = "M"
	
	if shiftOn:
		$"1".text = "!"
		$"2".text = "@"
		$"3".text = "#"
		$"4".text = "$"
		$"5".text = "%"
		$"6".text = "^"
		$"7".text = "&"
		$"8".text = "*"
		$"9".text = "("
		$"0".text = ")"
		
		$GRAVE.text = "~"
		$MINUS.text = "_"
		$EQUALS.text = "+"
		$LBRACKET.text = "{"
		$RBRACKET.text = "}"
		$BSLASH.text = "|"
		$SEMI.text = ":"
		$APOSTROPHE.text = "\""
		$COMMA.text = "<"
		$PERIOD.text = ">"
		$FSLASH.text = "?"
	if !capsOn and !shiftOn:
		$Q.text = "q"
		$W.text = "w"
		$E.text = "e"
		$R.text = "r"
		$T.text = "t"
		$Y.text = "y"
		$U.text = "u"
		$I.text = "i"
		$O.text = "o"
		$P.text = "p"
		
		$A.text = "a"
		$S.text = "s"
		$D.text = "d"
		$F.text = "f"
		$G.text = "g"
		$H.text = "h"
		$J.text = "j"
		$K.text = "k"
		$L.text = "l"
		
		$Z.text = "z"
		$X.text = "x"
		$C.text = "c"
		$V.text = "v"
		$B.text = "b"
		$N.text = "n"
		$M.text = "m"
		
		$"1".text = "1"
		$"2".text = "2"
		$"3".text = "3"
		$"4".text = "4"
		$"5".text = "5"
		$"6".text = "6"
		$"7".text = "7"
		$"8".text = "8"
		$"9".text = "9"
		$"0".text = "0"
		
		$GRAVE.text = "`"
		$MINUS.text = "-"
		$EQUALS.text = "="
		$LBRACKET.text = "["
		$RBRACKET.text = "]"
		$BSLASH.text = "\\"
		$SEMI.text = ";"
		$APOSTROPHE.text = "'"
		$COMMA.text = ","
		$PERIOD.text = "."
		$FSLASH.text = "/"
