extends Node2D

var text : RichTextLabel
var maxChoices : int = 6

var appreciationOfNature : int = 0
var loveOfGod : int = 0
var molochAgree : int = 0
var beezlebubAgree : int = 0
var belialAgree : int = 0

var feeling : String

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
	await text.doneWriting
	
	var opt = await getopt([1])
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

	'You may ask what draws our attention thus,' MOLOCH said, brow kingly and wont of a burning fire 'neath deathly shade.")
	
	# wait on continue
	await cont1()
	
	await writeNormal("
	
	BELIAL speaks thusly, 'Our Almighty gives speech today. We were woken by fellow angels 'midst the night on their own pilgrimage to the center of this great land, not unlike our own journey but of more certain aim. God hath granted us our own will to fly and do where and what we wish--do we wish to see see such a Heavenly pronouncement?'
	
What do you do?
	1. We will attend
	2. We will continue our own journey
	3. What is to be said?")
	
	opt = await getopt([1,2,3])
	if opt == 3:
		await writeNormal("

	You ask plainly, 'What is to be said at this great banquet of The Almighty?'
	
	'We know not but that it is His wish that His Greatest attend' says BELIAL. 

What do you do?
	1. If it's important, we will hear of it later
	2. God's messages will ring out all around us for He is everywhere
	3. We will attend upon his request
	4. He is our Lord and his will intrigues me. We will join him and our brethren angels")
		if opt == 2 or opt == 4:
			loveOfGod += 1
		else:
			loveOfGod -= 1

		opt = await getopt([1,2,3,4])
		if opt == 1 or opt == 2:
			await writeNormal("

'We will tread our own path,' you declare.")
			await cont1()
			await noattend()
		elif opt == 3 or opt == 4:
			await writeNormal("

'We shall attend on our Lord's words,' you say.")
			await cont1()
			await attend()
	elif opt == 1:
		writeNormal("
		
You admit to your companions, 'We will attend the Lord's request--I am very intrigued.'")
		await attend()
		
	elif opt == 2:
		writeNormal("
		
And so after some thought you say, 'I've decided we shall continue our own journey,'")
		await noattend()


func attend() -> void: ## INCOMPLETE
	writeNormal("
	
	And so LUCIFER and his cadre decide to see what is afoot at the Center of Heaven--whether that is curiosity, obedience, or respect of the Almighty's designs. ")
	

func noattend() -> void:
	await writeNormal("
	
	And so LUCIFER and his cadre decide to continue their journey, respecting that the Almighty gave them their will and knowing He is understanding. The Message of God shall quick find their ears the same.")
	
	await cont1()
	
	await writeNormal("
	
	LUCIFER continues his journey, scouting, learning, and reveling in the beauty of Heaven. West along the foot of the mountain, atimes alight on their wings or else on foot, pausing frequently to observe this first-seen land, they continue. Each spoke their thoughts roving now, though interested in the happenings of the Court of God this day enraptured fully in oth'wise unprec-dented journey far askew haven angelic.")
	
	await cont1()
	
	await writeNormal("
	
	This now they see: a tooth of stone of the Heaven conquered by God jutting higher yet than seen before, justly they stood astonished. Snow-capped it stood for seeming leagues above them.
	
	Upon this sight the fiery MOLOCH says: 'Great is the might of God as oft eludes us his sons. Unquenchable his fury it may be and might yet. What great powers else dost our Lord reveal upon this day?'")
	
	await cont1()
	
	await writeNormal("
	
	BEEZLEBUB stands crosswise, 'MOLOCH,' he says, 'Upon your elegizing you mythologize our Lord greater--He takes no form but of a Presence of Heaven--I believe he is knowable, though infinite, if infinite be knowable indeed. ")
	
	await cont1()
	
	await writeNormal("
	
	BELIAL stands a'gleaming before his allies and utters thus: 'Whereof we come is of no doubt, the center of heaven and the right Godly Center of Heaven we pronounce our Lord. Thereof is no doubt. Considering it heavily makes this also a pilgrimage of faith which need not be.")
	
	await writeNormal("
	
What do you say?
	1. I agree with MOLOCH, perhaps we should have strove nearer our Center this day.
	2. I agree with MOLOCH, I am concerned about the power that God may hold.
	3. I agree with BEEZLEBUB, we take our material forms to grow closer to God and to know Him.
	4. I agree with BEEZLEBUB, though I stand that the infinite may not be grasped entirely.
	5. I agree with BELIAL, senseless argument brings us nowhere. 
	6. I agree with BELIAL, a pilgrimage of faith it is not.")
	
	var opt = await getopt([1,2,3,4,5,6])
	if opt == 1:
		await writeNormal("
		
	You say, 'I agree with MOLOCH, perhaps we should have strove nearer our Center this day...'")
		molochAgree += 1
		pass
	if opt == 2:
		await writeNormal("
		
	You say, 'I agree with MOLOCH, I am concerned about the power that God may hold...'")
		molochAgree += 1
		pass
	if opt == 3:
		await writeNormal("
		
	You say, 'I agree with BEEZLEBUB, we take our forms to grow closer to God and to know Him...'")
		beezlebubAgree += 1
		pass
	if opt == 4:
		await writeNormal("
		
	You say, 'I agree with BEEZLEBUB, though I stand that the infinite may not be grasped entirely...'")
		beezlebubAgree += 1
		pass
	if opt == 5:
		await writeNormal("
		
	You say, 'I agree with BELIAL, senseless argument brings us nowhere...'")
		belialAgree += 1
		pass
	if opt == 6:
		await writeNormal("
		
	You say, 'I agree with BELIAL, a pilgrimage of faith it is not...'")
		belialAgree += 1
		pass
	
	await writeNormal("
	
	Just as your last words fall silent the ground shakes and the tooth of rock far off reverbrates and rings, reflecting within itself and near its root, as a call in empty room or wave in clear pond, like that nymph Echo. Thrice you hear it ring and upon the third the mountain shakes. At the final call a great rush of leaden snow rolls down the side battering all in its way. Residual shakes make your feet uneasy--trees tremble and the world remains silent out of respect.")

	await cont1("\n\n1. What is happening?")
	
	await writeNormal("
	
	The breeze of God's whispers returns.
	
	Raving MOLOCH turns on a foot aghast and speaks thusly: 
		'The Power of God above has shown its face 
		 in cataclysm, here! Our Lord must speak
		 with sweetest harming words now, or some
		 great spectacle shown to brethren sons.'")
		
	await writeNormal(
		"
What do you do?
	1. Split up and examine the destruction around you
	2. Look towards the Center
		")
	opt = await getopt([1,2])
	if opt == 1: # Split up and look around ## INCOMPLETE
		await writeNormal(
			"
	You decide to split up and look around. Where you stray are fissures in the soil. You wander further and find the great pile of snow now attempting to melt. It lies in great contrast to the dry canyon in which it rests. You find respite on the precipice for a moment. 
	
	Suddenly, leaves crinkle and rustle behind you by uncareful steps and a figure of cherub-look appears. He looks past you and thus you say: 
		'Ho there, wanderer. You carry no deft or deceit and I sense no untoward nature of you, but of a sudden you do appear. Who might you be? A lost cherub, a new companion to our journeys perhaps, but a clumsy one, and a wingless form for the moment. LUCIFIER, I be, a sojourner, of the sons of God as you may be. Experiencer of that perhaps devine cataclsym hours past, thrice the mountain rung and oft ground shook and snow fell. I say again, who might you be, fellow?'
			"
		)
		
		await cont1("1. Well??")
		
		await writeNormal(
			"
	The stranger now looks squarely on and through you eyes alight and a gaze like that of a strike of a sword, it impacts and carries through. Lo, the stranger says:
		'Greetings LUCIFER, fellow of wanderers in this Land of Faith. Aye, I heard the same a short time ago. Yet... at that time I was alight and heard it only and experienced not the unsteadiness I hear you now describe. How unlucky or perhaps favorable we are to meet now.'
			"
		)
		
		await cont1(
			"
1. You know who I am?
			"
		)
		
		await writeNormal(
			"
	'Aye, I know ye,' the wanderer continues, 'LUCIFER, Great of the angels of heaven, sons of God! 
	
	And you will continue to be known, I am sure of it. 
	
	We all stand within the strand of time. Do you believe in your own control over your future? Is it entirely within your control? Or, middling, are our lives like a braid pinned at end and start yet spread wide in the middle, to be fixed again at end of time?'
			"
		)
		
		await cont1(
			"
1. What, dost thou portend?
			"
		)
		
		await writeNormal(
			"
	The wanderer smiles slowly with mirth and speaks: 'Portend? I dream as much. You crumble at perplexity. I know not where you will go, but you may still ask me, if it entertain ye. I merely know the comings and goings and the patters of heaven.'
			
What do you ask?
	1. I will not ask a question.
	2. Who are you?
	3. What happened in the Center today?
	4. What is in my future?
			"
		)
		
		opt = await getopt([1,2,3,4])
		if opt == 1:
			writeNormal(
				"
	'So be it,' says the man.
				"
			)
			pass
		if opt == 2:
			writeNormal(
				"
	'I am who you see me as while I do not,' says the wanderer.
				"
			)
			pass
		if opt == 3:
			writeNormal(
				"
	'Heaven has a new Son,' reveals the wanderer. 
				"
			)
			pass
		if opt == 4:
			writeNormal(
				"
	'LUCIFER, greatest of potentials in Heaven, you will have the mightiest sway of the future to come,' says the wanderer.
				"
			)
		writeNormal(
			"
I hope you will be satisfied with your decision,' he continues.

	A high whistle beckons and the wanderer follows now, waving goodbye. You remain seating. He is gone.
			"
		)
	
		await cont1()
		
		await writeNormal(
			"
	
			"
		)
		
		
		
		
		
	if opt == 2: # Look towards the center
		await writeNormal(
		"
	You take to your wings and soar to great heights to investigate the Center. The eyes angelic contract far distance. 
	The sun is embattled now for her greatness in the sky at the center, though she still the victor. A second light thus joins the horizon where the Center the Lord Above inhabits. Four white towers there now reside about a great central chamber out of which points His vision. A great stair approaches from the East to this new hill. 
	
	'God hath made construction, meseems,' you say to your companions, 'I know not.'
		")
		
		await cont1()
		
		await writeNormal(
			"
	BELIAL fairly asks, 'A new temple for himself?'
	'A home, what of home need our immaterial Lord?' says BEEZLEBUB. 
	'To be worshipped?' flames MOLOCH.
	
	You float down to the surface again. 
	
Shall you head back to the center or stay where you are, contemplating?
	1. Head back
	2. Remain where you are
			"
		)
		opt = await getopt([1,2])
		if opt == 1:
			await writeNormal(
				"
	'I do not know what to think. I think we shall head back,' you say.
				"
			)
			await headBack()
			
		if opt == 2:
			await writeNormal(
				"
	'I am suffused with shock and awe. We must remain here awhile to think on these matters,' you say.
				"
			)
			await stayPut()
			pass
		
	

# attend, cataclysm, {rise into air, split up investigate}, head back
func headBack() -> void: ## INCOMPLETE
	pass

# attend, cataclysm, {rise into air, split up investigate}, stay put
func stayPut() -> void: ## INCOMPLETE
	pass

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
		await cont1("\n\n1. Approach companions")
		pass
	elif opt == 2:
		await writeNormal("

A small beach rests calmly upon the lake to the east, a great spot to recline.

		You gain an appreciation of nature.")
		appreciationOfNature += 1
		await cont1("\n\n1. Approach companions")
		pass
	elif opt == 3:
		await writeNormal("

Bits of interested conversation from your companions jut their way through the light breeze and the murmur, though only in tone and not of particular. You are not concerned.

		You gain an appreciation of nature.")
		appreciationOfNature += 1
		await cont1("\n\n1. Approach companions")
		pass
	elif opt == 4:
		await writeNormal("

There is a gentle rustle in the underbrush of the birch forest to the west. Small things dart in and out playfully.

		You gain an appreciation of nature.")
		appreciationOfNature += 1
		await cont1("\n\n1. Approach companions")
		pass
	pass


## Simple function for printing a single simple line, waiting for user input of 1
func cont1(lines : String = "\n\n1. Continue") -> void:
	await writeNormal(lines)
	var _opt = await getopt([1])


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
	if event.is_action_pressed("1"):
		optionNum.emit(1)
		
	if event.is_action_pressed("2"):
		optionNum.emit(2)
		
	if event.is_action_pressed("3"):
		optionNum.emit(3)
		
	if event.is_action_pressed("4"):
		optionNum.emit(4)
		
	if event.is_action_pressed("5"):
		optionNum.emit(5)
		
	if event.is_action_pressed("6"):
		optionNum.emit(6)
		
	if event.is_action_pressed("quit"):
		get_tree().change_scene_to_file("res://Main.tscn")


