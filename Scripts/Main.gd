extends Node2D

var text : RichTextLabel
var maxChoices : int = 6

var options : Array = [["", ""], ["", ""], ["", ""], ["", ""], ["", ""], ["", ""]]
var canSelectNow : bool = false

var appreciationOfNature : int = 0

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
	# STAY ATOP HILL
	if opt == 1: 
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
		
		var optionsTaken : Array = []
		opt = await getopt([1,2,3,4,5])
		# LOOK NORTH
		if opt == 1: 
			text.w += "

A great mountain stands to the north, fresh water rolls down from the summit to the lake below. 
"
			text.writeContinue()
			await text.doneWriting
			await secondDirectionLook()
			pass
			
		# LOOK EAST
		elif opt == 2:
			text.w += "

A lake to the east is where the water from the summit drains, perfectly reflecting the sky. 
"
			text.writeContinue()
			await text.doneWriting
			await secondDirectionLook()
			pass
		
		# LOOK SOUTH
		elif opt == 3:
			text.w += "

Your companions stand in a small circle in a glade visible from the hill, gentle pertubations in the terrain create pleasant ripples in the land. The breeze sways the tall grass.
"
			text.writeContinue()
			await text.doneWriting
			await secondDirectionLook()
			pass
			
		# LOOK WEST
		elif opt == 4:
			text.w += "

A forest of birch casts gentle shadows, a runoff stream from the mountain carves delicately through the wood, soft sounds of burbling.
"
			text.writeContinue()
			await text.doneWriting
			await secondDirectionLook()
			pass
			
		# ELSE DO NOTHING, CONTINUE AS NORMAL
		pass
	
	# ELSE GO TO FRIENDS (HAPPENS NO MATTER WHAT)
	text.w += "
	
	You approach your companions now, BEEZLEBUB, MOLOCH, BELIAL, and so on in the midst of their discussion"
	text.writeContinue()
	await text.doneWriting
	text.w += "

		'Good of you to finally join us! Getting a good look around?' asks BEEZLEBUB. 
		You reply, 
			'What point of wandrous journey else to lavish
			amongst great unknown lands and learn the love
			of our most kindly father? Yea, I watch.'"
	if appreciationOfNature > 0:
		text.w += "
		'Every place we stop contains untold beauty, each pause a great moment of wonder,' you continue."
	text.w += "

	'You may ask what draws our attention thus,' Moloch said, brow kingly and wont of a burning fire 'neath deathly shade.
	
	1. Continue"
	text.writeContinue()
	await text.doneWriting
	
	opt = await getopt([1])
	
	text.w += "
	BELIAL speaks thusly, 'Our Almighty gives speech today. We were woken by fellow angels 'midst the night on their own pilgrimage to the center of this great land, not unlike our own journey but of more certain aim. God hath granted us our own will to fly and do where and what we wish--do we wish to see see such a Heavenly pronouncement?'"
	text.writeContinue()
	await text.doneWriting
	

func secondDirectionLook():
	text.w += "
	You remain on the hill for now.

		1. Look North
4. Look West 		2. Look East
		3. Look South
		
		5. Leave"
	text.writeContinue()
	await text.doneWriting
	
	var opt = await getopt([1,2,3,4,5])
	if opt == 1:
		text.w += "

The mountain in the north appears as the greatest knife of a giant, jutting through the land, jagged separate points covered now in snow.

		You gain an appreciation of nature."
		text.writeContinue()
		await text.doneWriting
		appreciationOfNature += 1
		pass
	elif opt == 2:
		text.w += "

A small beach rests calmly upon the lake to the east, a great spot to recline.

		You gain an appreciation of nature."
		text.writeContinue()
		await text.doneWriting
		appreciationOfNature += 1
		pass
	elif opt == 3:
		text.w += "

Bits of interested conversation from your companions jut their way through the light breeze and the murmur, though only in tone and not of particular. You are not concerned.

		You gain an appreciation of nature."
		text.writeContinue()
		await text.doneWriting
		appreciationOfNature += 1
		pass
	elif opt == 4:
		text.w += "

There is a gentle rustle in the underbrush of the birch forest to the west. Small things dart in and out playfully.

		You gain an appreciation of nature."
		text.writeContinue()
		await text.doneWriting
		appreciationOfNature += 1
		pass
	pass

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
