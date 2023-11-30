extends Node2D

var text : RichTextLabel
var maxChoices : int = 6

var options : Array = [["", ""], ["", ""], ["", ""], ["", ""], ["", ""], ["", ""]]
var canSelectNow : bool = false

signal optionNum(opt : int)

# Called when the node enters the scene tree for the first time.
func _ready():
	text = $Layout/RichTextLabel
	_start()

func getopt(optList : Array) -> int:
	var opt : int = await optionNum
	while(!optList.has(opt)):
		opt = await optionNum
	return opt


# "Main Menu" start condition
func _start():
	text.w = "PARADISE LOST: THE TEXT ADVENTURE\nby Ethan Scheelk\n2023-11-27\n"
	text.writeFromStart()
	
	text.w += "\n\nPress 1 to begin\n\nPress q at any time to return to the start"
	options[0] = [text.command.writeContinue, 
		"
You are LUCIFER,
great of the angels of heaven.
	
	You wake to the early morn, light suffusing all.
Your eye wanders upon the beauty about and see from atop your hill your companions in the distance."]
	
	await text.doneWriting
	
	var opt : int = await getopt([1])
	
	text.w = "
You are LUCIFER,
great of the angels of heaven.
	
	You wake to the early morn, light suffusing all.
Your eye wanders upon the beauty about and see from atop your hill your companions in the distance.

What do you do?
	1. Stay atop the verdant hill
	2. Approach your companions"
	text.writeFromStart()
	await text.doneWriting
	
	
	opt = await getopt([1,2])
	if opt == 1: # Stay atop the hill
		text.w += "

You stay upon the dewy verdant hill,
the grass a'glist with anticipation for the day. 

You, LUCIFER, stretch your shoulders and turn slowly about taking in the fresh air and the gentle breeze blowing your gentle golden locks. All about is the land you, wandering, call home for now. You daren't harm this great scenery--it is as it was made and it is perfect.

		1. Look North
4. Look West 		2. Look East
		3. Look South
		
		5. Leave"
		text.writeContinue()
		await text.doneWriting
		
		var directions : Array = []
		opt = await getopt([1,2,3,4,5])
		
		pass
	
	# Happens no matter what
	text.w += "
	
	You approach your companions now, BEEZLEBUB, etc. idk lol"
	text.writeContinue()
	await text.doneWriting
	
	
func _game():
	
	pass
	
func _input(event):
	if Input.is_action_pressed("1"):
		optionNum.emit(1)
#		doN(0)
		
	if Input.is_action_pressed("2"):
		optionNum.emit(2)
#		doN(1)
		
	if Input.is_action_pressed("3"):
		optionNum.emit(3)
#		doN(2)
		
	if Input.is_action_pressed("4"):
		optionNum.emit(4)
#		doN(3)
		
	if Input.is_action_pressed("5"):
		optionNum.emit(5)
#		doN(4)
		
	if Input.is_action_pressed("6"):
		optionNum.emit(6)
#		doN(5)
		
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
