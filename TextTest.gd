extends RichTextLabel
class_name TextTest

@export var w : String = "Hello there! This is a \ntest text.\nI'm gonna keep\n adding newlines."

@export var charNF : int = 1
@export var spaceNF : int = 3
@export var newLineNF : int = 20

var writing : bool = false
var hasWritten : bool = false
var index : int = 0
var time : float = 0
var waitFrames : int = 0
var currentChar : String = ''

signal doneWriting

func write():
	currentChar = w[0]
	text = ""
	writing = true
	index = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func _updateCurrentChar():
	index += 1
	if index >= len(w):
		writing = false
		doneWriting.emit()
	else:
		currentChar = w[index]
		
func _setWaitFrames():
	if writing:
		if currentChar == '\n':
			waitFrames = newLineNF
		elif currentChar == ' ':
			waitFrames = spaceNF
		else:
			waitFrames = charNF
	pass

func _updateWriting():
	if writing:
		if waitFrames == 0:
			text += currentChar
			_updateCurrentChar()
			_setWaitFrames()
		else:
			waitFrames -= 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_updateWriting()
	pass


func _on_button_pressed():
	pass # Replace with function body.
