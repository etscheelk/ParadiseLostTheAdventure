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
#	await writeNormal("
#You are LUCIFER,
#great of the angels of heaven.
#
#	You wake to the early morn, light suffusing all.
#Your eye wanders upon the beauty about and see from atop your hill your companions in the distance.
#
#What do you do?
#	1. Stay atop the verdant hill
#	2. Approach your companions")
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
		await writeNormal("

You stay upon the dewy verdant hill,
the grass a'glist with anticipation for the day. 

You, LUCIFER, stretch your shoulders and turn slowly about taking in the fresh air and the gentle breeze blowing your gentle golden locks. All about is the land you, wandering, call home for now. You daren't harm this great scenery--it is as it was made and it is perfect.

		1. Look North
4. Look West 		2. Look East
		3. Look South
		
		5. Leave")
		
		opt = await getopt([1,2,3,4,5])
		# LOOK NORTH
		if opt == 1: 
			await writeNormal("

A great mountain stands to the north, fresh water rolls down from the summit to the lake below. 
")
			await secondDirectionLook()
			pass
			
		# LOOK EAST
		elif opt == 2:
			writeNormal("

A lake to the east is where the water from the summit drains, perfectly reflecting the sky. 
")
			await secondDirectionLook()
			pass
		
		# LOOK SOUTH
		elif opt == 3:
			await writeNormal("

Your companions stand in a small circle in a glade visible from the hill, gentle pertubations in the terrain create pleasant ripples in the land. The breeze sways the tall grass.
")
			await secondDirectionLook()
			pass
			
		# LOOK WEST
		elif opt == 4:
			await writeNormal("

A forest of birch casts gentle shadows, a runoff stream from the mountain carves delicately through the wood, soft sounds of burbling.
")
			await secondDirectionLook()
			pass
			
		# ELSE DO NOTHING, CONTINUE AS NORMAL
		pass
	
	# ELSE GO TO FRIENDS (HAPPENS NO MATTER WHAT)
	await writeNormal("
	
	You approach your companions now, BEEZLEBUB, MOLOCH, BELIAL, and so on in the midst of their discussion.")
	
	await writeNormal("

		'Good of you to finally join us! Getting a good look around?' asks BEEZLEBUB. 
		You reply, 
			'What point of wandrous journey else to lavish
			amongst great unknown lands and learn the love
			of our most kindly father? Yea, I watch.'")
			
	if appreciationOfNature > 0:
		await writeNormal("
		'Every place we stop contains untold beauty, each pause a great moment of wonder,' you continue.")
		
	writeNormal("

	'You may ask what draws our attention thus,' Moloch said, brow kingly and wont of a burning fire 'neath deathly shade.")
	
	await cont()
	
	await writeNormal("
	
	BELIAL speaks thusly, 'Our Almighty gives speech today. We were woken by fellow angels 'midst the night on their own pilgrimage to the center of this great land, not unlike our own journey but of more certain aim. God hath granted us our own will to fly and do where and what we wish--do we wish to see see such a Heavenly pronouncement?'")

func secondDirectionLook():
	await writeNormal("
	You remain on the hill for now.

		1. Look North
4. Look West 		2. Look East
		3. Look South
		
		5. Leave")
	
	var opt = await getopt([1,2,3,4,5])
	if opt == 1:
		await writeNormal("

The mountain in the north appears as the greatest knife of a giant, jutting through the land, jagged separate points covered now in snow.

		You gain an appreciation of nature.")
		appreciationOfNature += 1
		await approachFriends()
		pass
	elif opt == 2:
		await writeNormal("

A small beach rests calmly upon the lake to the east, a great spot to recline.

		You gain an appreciation of nature.")
		appreciationOfNature += 1
		await approachFriends()
		pass
	elif opt == 3:
		await writeNormal("

Bits of interested conversation from your companions jut their way through the light breeze and the murmur, though only in tone and not of particular. You are not concerned.

		You gain an appreciation of nature.")
		appreciationOfNature += 1
		await approachFriends()
		pass
	elif opt == 4:
		await writeNormal("

There is a gentle rustle in the underbrush of the birch forest to the west. Small things dart in and out playfully.

		You gain an appreciation of nature.")
		appreciationOfNature += 1
		await approachFriends()
		pass
	pass

func approachFriends() -> void:
	await writeNormal("

1. Approach companions")
	var opt = await getopt([1])

func cont() -> void:
	await writeNormal("
	
1. Continue")
	var opt = await getopt([1])


## For normal text use. Add words to the printing text, continue writing, 
## waiting until text is done writing
##
## the correct call of this function is `await writeNormal("...")` so
## Threading shenanigans don't happen. 
func writeNormal(words : String) -> void:
	text.w += words
	text.writeContinue()
	await text.doneWriting
	
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
		get_tree().change_scene_to_file("res://Main.tscn")
		
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
