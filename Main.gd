extends Node2D

var text : RichTextLabel
var maxChoices : int = 6

var options : Array = [["", ""], ["", ""], ["", ""], ["", ""], ["", ""], ["", ""]]
var canSelectNow : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	text = $Layout/RichTextLabel
	_start()


# "Main Menu" start condition
func _start():
	text.w = "PARADISE LOST: THE TEXT ADVENTURE\nby Ethan Scheelk\n2023-11-27\n"
	text.writeFromStart()
	
	text.w += "\n\nPress 1 to begin"
	options[0] = [text.command.writeContinue, 
		" \n\nYou are LUCIFER,\ngreat of the angels of heaven.\n\n\tYou wake to the early morn, light suffusing all."]
	

	
func _input(event):
	if Input.is_action_pressed("1"):
		doN(0)
		
	if Input.is_action_pressed("2"):
		doN(1)
		
	if Input.is_action_pressed("3"):
		doN(2)
		
	if Input.is_action_pressed("4"):
		doN(3)
		
	if Input.is_action_pressed("5"):
		doN(4)
		
	if Input.is_action_pressed("6"):
		doN(5)
		
	if Input.is_action_pressed("quit"):
		_start()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func doN(n : int):
	if not canSelectNow:
		print("Can't select now")
		return
	if options[n] == ["", ""]:
		print("Option [", n, "] not bound right now")
		return
	else:
		canSelectNow = false
#		text.w += options[n][1]
		text.w = options[n][1]
#		text.writeContinue()
		text.writeFromStart()
		print("Option [", n, "] chosen.")
		_resetOptions()
		
func _resetOptions() -> void:
	for i in range(maxChoices):
		options[i] = ["", ""]


func on_done_writing():
	canSelectNow = true
