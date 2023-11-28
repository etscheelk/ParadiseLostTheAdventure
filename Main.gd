extends Node2D

var text : RichTextLabel
var maxChoices : int = 6

var options : Array = [["", ""], ["", ""], ["", ""], ["", ""], ["", ""], ["", ""]]

# Called when the node enters the scene tree for the first time.
func _ready():
	$Filter.visible = true
	text = $Layout/RichTextLabel
	_start()


# "Main Menu" start condition
func _start():
	text.w = "PARADISE LOST: THE TEXT ADVENTURE\nby Ethan Scheelk\n2023-11-27\n"
	text.write()
	
	text.w += "\n\nPress 1 to begin"
	options[0] = ["", "Test"]
	pass
	
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
		pass
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func doN(n : int):
	if options[n] == ["", ""]:
		return
	else:
		print("hello there")
		
func resetOptions() -> void:
	for i in range(maxChoices):
		options[i] = ["", ""]
