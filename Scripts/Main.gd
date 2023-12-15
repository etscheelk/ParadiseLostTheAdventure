extends Node2D

var text : RichTextLabel
var maxChoices : int = 6

var appreciationOfNature : int = 0
var loveOfGod : int = 0
var molochAgree : int = 0
var beezlebubAgree : int = 0
var belialAgree : int = 0

var feeling : String

var knowsOfSon : bool = false
var tellsAboutSon : bool

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

Your companions stand in a small circle in a glade visible from the hill, gentle perturbations in the terrain create pleasant ripples in the land. The breeze sways the tall grass.
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
	
	BELIAL speaks thusly, 'Our Almighty gives speech today. We were woken by fellow angels 'midst the night on their own pilgrimage to the center of this great land, not unlike our own journey but of more certain aim. God hath granted us our own will to fly and do where and what we wish--do we wish to see such a Heavenly pronouncement?'
	
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
	4. He is our Lord, and his will intrigues me. We will join him and our brethren angels")
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
		
And so, after some thought you say, 'I've decided we shall continue our own journey,'")
		await noattend()


func attend() -> void: ## INCOMPLETE
	await writeNormal(
		"
	And so, LUCIFER and his cadre decide to see what is afoot at the Center of Heaven--whether that is curiosity, obedience, or respect of the Almighty's designs.
		"
	)
	
	await cont1(
		"
1. Continue
		"
	)
	
	await writeNormal(
		"
	Their mountain vista now molds and melds through many shapes as they travel. Pleasant green rolling hills, gentle plateaus of lush forests. Now, they approach the beatific center of the Center. They approach from elevation, standing on the cliff before it. Great round trees, the legs of giants block their view occasionally as they follow the path parallel to the cliff. There is an intense energy in the air, a virtual buzzing, Heaven a-hum with anticipation. 
		"
	)
	
	await cont1(
		"
1. Continue
		"
	)
	
	await writeNormal(
		"
	Throngs upon throngs of brethren angels arrive, many landing to take pleasant strolls along paths laden with flowers. You exchange pleasantries with other friends and acquaintances, disclose your recent journey 'round heaven. 
	
	The center is a gorge, wrapped about by this great cliff. About the center five tiers of cascading falls lie, each tier its own small home to a series of small pools where crystal-clear water rests for a time before continuing its journey down the cliff. Uncountable angels remain in places of relaxation among the water and the shade. 
	This gorge feeds all the waters of Heaven, itself fed by the waters of the Source, the Center. 
		"
	)
	
	await cont1(
		"
1. Continue
		"
	)
	
	await writeNormal(
		"
	'You seem greater at ease, my friend LUCIFER,' BELIAL says, 'as we now approach... why is that?'
	
What do you say?
	1. It's the natural beauty of heaven that relaxes me
	2. Being nearer His Almighty Self brings me comfort
		"
	)
	
	var opt = await getopt([1,2])
	if opt == 1: # nature
		await  writeNormal(
			"
	'This center holds great beauty--the grade of Heaven relaxes me,' you say.
	
	BELIAL, seeking argument says thusly: 'We were just on our own trip through the beauty of Heaven, I will not argue the serenity of the center, but did we see nothing of comparison? Were you not happy many leagues from here? Where we were this morning?'
	
	'Maybe we hurt ourselves to ponder happiness such--elated we are and perhaps we shall simply accept it,' you say.
			"
		)
	if opt == 2: # god
		await writeNormal(
			"
	'It is the presence and proximity of His Almighty Self which brings me comfort,' you say. 
	
	BELIAL, seeking argument says thusly: 'Have you met God? Did he give pause when creating you? This warmth we feel entire is his influence, no doubt, but it feels artificial. If we need it to be happy as we are now, then what is God's true influence?'
	
	'Maybe,' you say, 'it is God which hath put you in such a playful mood, BELIAL.'
			"
		)
	
	await cont1(
		"
1. Continue
		"
	)
	
	await writeNormal(
		"
	Some time passes thusly in serenity in the center of Heaven, awaiting this great announcement or pronouncement. The mass of angels takes all the space it can about the center on all tiers. Decorations begin to appear alongside the guiding paths, among the trees, and a festive mood overtakes all. The sun has now begun her descent past noontime. More arrivals expand outward and upward upon their wings. Floating piers materialize to provide respite and greater decoration to the convocation. 
		"
	)
	
	await cont1(
		"
1. Continue
		"
	)
	
	await writeNormal(
		"
	Chatter continues yet each begins to feel a tingling in their fingers. The water in the center begins to rumble and shine beneath the surface, bubbling from the love of God. Geysers erupt within the center, cacophonous, glowing prismatic. Beads of mist hang in the air, each spill comes to a crawl, frozen in time--giving each eye the chance to peruse this spectacle sharpened. A honed pillar of light appears in the center slowly rising, elevating sheets of water alongside. This pillar rises now of a total height twice that of the cataract, the sprinkling still diamantine aglow. 
		"
	)
	
	await cont1(
		"
1. The Lord, Center of center, has arrived!
		"
	)
	
	await writeNormal(
		"
	The silent faith internal, the worship, admiration, the want of nothing screamed much louder than any crowd of the same size, silent yet deafening, if it can be thought. The Voice spoke now,
		'Greater Glory! Greater Glory! So glad
		 am I to see these angels mine. To you
		 is sworn my promise honest, me to thee. 
		
		 This day I have begot whom I declare
		 my only Son and on this holy seat
		 him have annointed whom ye now behold
		 as my right hand. Your head I Him appoint
		 and by Myself have sworn to Him shall bow
		 All knees in Heav'n and shall confess Him Lord.
		"
	)
	
	await cont1(
		"
1. Continue
		"
	)
	
	await writeNormal(
		"
	The pillar of light now opened and strode out The SON, his own sun for a momen, upon the faintest bridge of light, atimes upon nothing, towards the nearest shore at the base of the depression. 
	
	You think to yourself for a time: 'His ONLY son? Are we forgotten then? An extension of God's power--are we not respected? Do we stray from Him or does he wish to firmly grasp his troop? 
	Nay, we are not forgotten. We are instead supplied new master.'
		"
	)
	
	await cont1(
		"
1. Continue
		"
	)

	await writeNormal(
		"
	The Son rises now and with him four great white towers in each direction, marring the landscape. Each tower focuses his light--shortly each angel is blinded but hears a great catastrophe. Crushing stone, crashing water, a feeling of being grabbed and whisked around. Upon regaining sight many see now that they have been misplaced since where they stood not resides some new construction--a temple and throne for God and His Son. 
	
	The gorge and cataract have been removed. Thirdly and finally, a great stair like of marble torn from the ground in the east of the temple--one-hundred steps--up to the entrace of His temple, where we will watch His subjects. 
		"
	)
	
	await cont1(
		"
1. Find your companions
		"
	)
	
	await writeNormal(
		"
	This... transformation... disgusts you. Warmth leaves you to be replaced by despair. You try to seek out your companions, wherever they have gone. You eventually find them on the north side of the gorge-now-temple, the opposite side from which you started. You glide down to them slowly.
	You say to them, 'This transfiguration of the landscape is horrible and disgusting. And now the Almighty displaces the status of His sons? The Son our new leader, God a second, where faith previously directed only at the higher.
		")
	
	await cont1(
		"
1. Continue
		"
	)
	
	await writeNormal("
	MOLOCH says, 'God takes physical form to watch us more closely now.'
	
	BEEZLEBUB says, 'I thought maybe a material God would bring us closer, but I cannot think as much. No.'
	
	BELIAL then, swift and intelligent, suggests, 'Shall we appeal to him in his temple? Question his workings?'
	
	'Is this not blasphemy to question our Lord? Almighty I mean by Lord, then his Son,' says BEEZLEBUB. 
	
What do you do?
	1. I will appeal to God alone
	2. We shall not appeal to him--it is better that way ## INCOMPLETE
		"
	)
	opt = await getopt([1,2])
	
	if opt == 1:
		await confrontAlone()
	if opt == 2:
		await noConfront()
		pass

func confrontAlone() -> void: ## INCOMPLETE
	var angeredGod : int = 0
	
	await writeNormal(
		"
	You decide you shall confront God and appeal to Him alone in His new temple. You walk deliberately to the great eastern steps, yet you pause at the bottom. The sun hides herself from this sight to be now, in her great descent now.
	You take the first step, step, and step. One hundred in total, no landing nor break. Half way up the Sun now shows her dimmer side and torches alight appear flanking the stair, lighting in sequence from base to peak. No supplicants there be, all alone you are now. The orange haze of the sunset and the flames rends corners swelling in purple shade. 
		"
	)
	
	await cont1(
		"
1. Continue Stepping
		"
	)
	
	await writeNormal(
		"
	You reach the top and the white light of the Son pierces into the night. You peer inside, what should be warmth of the Love of God is shivers and a cool light. The chamner is high and long, a vaulted ceiling with carved pillars all the way down. Flames again, yet distrustful shadows cast behind each pillar. '
	
	The Son sits on his throne at the far end, raised several steps, conversing with the Light above him to his left. LUCIFER is seen by him far off but the Son pays no heed. 
	Plodding steps bring you closer until the Son halts you where you are,
		'No further now, kind LUCIFER, what do you come to Us with?'
		"
	)
	
	await cont1(
		"
1. I come with appeal and inquiry to the Lord, the Almighty I mean, and yourself, his... greater glory.
		"
	)
	
	await writeNormal(
		"
	'I am your Lord, what do you wish?,' the Son says. 
	
What do you say?
	1. Why build this temple? In its creation is also destruction of the greatest beauty of Heaven.
	2. What is the purpose of this temple?
		"
	)
	
	var opt = await getopt([1,2])
	if opt == 1: # mean
		angeredGod += 1
		await writeNormal(
			"
	You plead, 'Why build this temple? In its creation is also destruction of the greatest beauty of Heaven.'
	
	And the Son responds coolly: 'Nature is not the fittest object of thy worship. You stand before your God and this is what you ask? Not of the potential majesty?' 
			"
		)
	if opt == 2: # nice
		await writeNormal(
			"
	You ask, 'What is the purpose of this temple?`
	
	And the Son says thusly: 'To greater my Divine Father's eye. I am He manifest, in me find Him.
			"
		)
		
	await writeNormal(
		"
How do you respond?
	1. So what are we to do then, except worship our God supplanted?
	2. Our faith towards you, now?
		"
	)
	
	opt = await getopt([1,2])
	if opt == 1: # mean
		angeredGod += 1
		await writeNormal(
			"
	You question, 'So what are we to do then, except worship our God supplanted?
	
	'Not supplanted but doubled and I His physical, so you may grow closer. This is a gift to you. I suggest you watch your tone, LUCIFER, I have seen your future.'
			"
		)
	if opt == 2: # nice
		await writeNormal(
			"
	You ask, 'Our faith towards you, now?'
	
	'Towards me, aye, but towards my Father, too. I His physcial so He may grow closer to thee,' the Son says.
			"
		)
	
	
	await writeNormal(
		"
How do you respond?
	1. And You he call his only Son? What of his angelic sons, myself included?
	2. Why does He call you his only Son?
		"
	)
	
	opt = await getopt([1,2])
	angeredGod += 1
	if opt == 1:
		await writeNormal(
			"
	'And You he call his only Son? What of his angelic sons, myself included?' you ask.
			"
		)
	if opt == 2:
		await writeNormal(
			"
	'Why does He call you his only Son?' you ask.
			"
		)
		
	await writeNormal("
	'Ask not further, I command it. You invoke Our ire. Accept His word--I am your Lord now as well as He,' the Son commanded. 
	")
	
	await writeNormal(
		"
	You feel the air heavy around you, God's scorn for the questions.
	
	You catch your mind and begin to voice your final question, but the Son interrupts you:
		"
	)
	
	if angeredGod >= 3: # RENDERED TO ASH
		await writeNormal(
			"
		'I grow tired of your questions,' the Son says with a small wave of his hand. 
			"
		)
		
		await cont1(
			"
1. ...
			"
		)
		
		await writeNormal(
			"
	As your last voice leaves your mouth it becomes a scream. You have angered God. From your feet up you are rendered to sickly ash. Your wings are amputated as if by two great arms, you fall now and crawling you leave a disgusting trail. Pain, pain for the first time. It grows beyond your comprehension. Your arm outstretched on the first step to the throne is the last to dissolve. 
			"
		)
		
		await cont1(
			"
1. LUCIFER is dead
			"
		)
		
		await writeNormal(
			"
	LUCIFER's curdling screams were heard by his companions now standing at the base of the eastern stair. The final yell, with finality, blew out the torches leaving BEEZLEBUB, MOLOCH, and BELIAL in darkness. No one had heard screaming in this bountiful place before. 
	No words need be spoken by them. Mutual looks begat a mutual aim. God cannot be trusted. 
	
	
	An angel dead by His procedure deft
	has spelled the poss'ble future one--now death,
	this new thing, death, unique in heaven 'vealed. 
	In hearts of friends it strikes despair, to breed
	a greater fight of utmost dissent to'ards
	that Holy Name and His now wicked Son. 
	
	
	PARADISE      WILL     BE      LOST
			"
		)
		
	else: # NARROWLY ESCAPED ## INCOMPLETE
		await writeNormal(
			"
		'I grow tired of your questions,' the Son says with a small wave of his hand, 'I am merciful.' 
		
	You are transported to the entrance of the temple, now facing east. Your legs begin moving without your say so and you begin walking down the steps, torches drowned with every other step. Your mind is a fog yet it clears as you approach the bottom. Your companions, BEEZLEBUB, MOLOCH, and BELIAL wait for you at the bottom. 
			"
		)
		
		await cont1(
			"
1. Continue
			"
		)
		
		await writeNormal(
			"
	Your companions fawn over you, questioning what happend. To them you say thusly: 'I know not what happened near the end. Firsly I stood and questioned God and the Son and then a wave of his hand I appeared at the top of the stair and began walking down not of my own accord. To be here now with you,' you tell.
	You continue, 'It seems the Son has truly usurped our Almighty as our master, this a place of worship, we no longer the sons of God--He His only Son now. I feel I only narrowly escaped. We have been scorned.'
	
	
	Deceit hath made 
	
	
	
	
	PARADISE     WILL      BE      LOST
			"
		)


## INCOMPLETE
func noConfront() -> void:
	await writeNormal(
		"
	You and your companions decide that you shall not confront God--what answers do you truly expect? God and His only Son have shown who they are. You decide to begin your pilgrimage again, yet with schemes and plans.
	
	
	The true self of God exposed, deceitful
	is He, the deity of grand folk, the angels be lost
	to Him, or some, at least. This crew shall fight
	whate'er the future holds, conniving rebels
	that seek their freedom from the Holy Name.
	
	
	
	
	
	PARADISE      WILL      BE      LOST
		"
	)
	pass

func noattend() -> void:
	await writeNormal("
	
	And so LUCIFER and his cadre decide to continue their journey, respecting that the Almighty gave them their will and knowing He is understanding. The Message of God shall quick find their ears the same.")
	
	await cont1()
	
	await writeNormal("
	
	LUCIFER continues his journey, scouting, learning, and reveling in the beauty of Heaven. West along the foot of the mountain, atimes in flight on their wings or else on foot, pausing frequently to observe this first-seen land, they continue. Each spoke their thoughts roving now, though interested in the happenings of the Court of God this day enraptured fully in oth'wise unprec-dented journey far askew haven angelic.")
	
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
	1. I agree with MOLOCH, perhaps we should have strode nearer our Center this day.
	2. I agree with MOLOCH, I am concerned about the power that God may hold.
	3. I agree with BEEZLEBUB, we take our material forms to grow closer to God and to know Him.
	4. I agree with BEEZLEBUB, though I stand that the infinite may not be grasped entirely.
	5. I agree with BELIAL, senseless argument brings us nowhere. 
	6. I agree with BELIAL, a pilgrimage of faith it is not.")
	
	var opt = await getopt([1,2,3,4,5,6])
	if opt == 1:
		await writeNormal("
		
	You say, 'I agree with MOLOCH, perhaps we should have strode nearer our Center this day...'")
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
	
	Just as your last words fall silent the ground shakes and the tooth of rock far off reverberates and rings, reflecting within itself and near its root, as a call in empty room or wave in clear pond, like that nymph Echo. Thrice you hear it ring and upon the third the mountain shakes. At the final call a great rush of leaden snow rolls down the side battering all in its way. Residual shakes make your feet uneasy--trees tremble and the world remains silent out of respect.")

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
	var optCopy = opt
	if optCopy == 1: # Split up and look around
		await writeNormal(
			"
	You decide to split up and look around. Where you stray are fissures in the soil. You wander further and find the great pile of snow now attempting to melt. It lies in great contrast to the dry canyon in which it rests. You find respite on the precipice for a moment. 
	
	Suddenly, leaves crinkle and rustle behind you by uncareful steps and a figure of cherub-look appears. He looks past you and thus you say: 
		'Ho there, wanderer. You carry no deft or deceit and I sense no untoward nature of you, but of a sudden you do appear. Who might you be? A lost cherub, a new companion to our journeys perhaps, but a clumsy one, and a wingless form for the moment. LUCIFIER, I be, a sojourner, of the sons of God as you may be. Experiencer of that perhaps divine cataclysm hours past, thrice the mountain rung and oft ground shook and snow fell. I say again, who might you be, fellow?'
			"
		)
		
		await cont1(
			"
1. Well??
			"
		)
		
		await writeNormal(
			"
	The stranger now looks squarely on and through you, eyes alight and a gaze like that of a strike of a sword, it impacts and carries through. Lo, the stranger says:
		'Greetings LUCIFER, fellow of wanderers in this Land of Faith. Aye, I heard the same a short time ago. Yet... at that time I was by wing and heard it only and experienced not the unsteadiness I hear you now describe. How unlucky or perhaps favorable we are to meet now.'
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
			await writeNormal(
				"
	'So be it,' says the man.
				"
			)
			pass
		if opt == 2:
			await writeNormal(
				"
	'I am who you see me as while I do not,' says the wanderer.
				"
			)
			pass
		if opt == 3:
			await writeNormal(
				"
	'Heaven has a new Son,' reveals the wanderer. 
				"
			)
			knowsOfSon = true
			pass
		if opt == 4:
			await writeNormal(
				"
	'LUCIFER, greatest of potentials in Heaven, you will have the mightiest sway of the future to come,' says the wanderer.
				"
			)
		await writeNormal(
			"
I hope you will be satisfied with your decision,' he continues.

	A high whistle beckons and the wanderer follows now, bowing goodbye. You remain seated. He is gone.
			"
		)
	
		await cont1()
		
		if opt == 1 or opt == 2: # no question or who are you
			await writeNormal(
				"
	'What a strange man,' you say to yourself, 'Heaven has strange trespassers.'
				"
			)
			pass
		if opt == 3: # Heaven has new son
			await writeNormal(
				"
	'A new Son? He said it of particular importance. How did he know already? What does this spell for us? This must be what was revealed today--and caused this cataclysm here and all throughout Heaven. Are we now less significant to our Lord? 
				"
			)
			pass
		if opt == 4: # Told future importance
			await writeNormal(
				"
	'Claim of no portention yet portent it seem to be be. I am merely one--do I see too little for myself?
				"
			)
			pass
		
		await cont1(
			"
1. Return to the knoll whence you came to reconvene
			"
		)
		
		await writeNormal(
			"
	You return to your allies to whom you say:
	
	'I have met the strangest wanderer. He claimed no portent yet offered an answer to a question of my asking. I shall not reveal what I heard but whatever we all have seen or heard we are at an impasse. Either we continue our journey or we turn back to learn more of the happenings of today--what of the Center today.'
	
	The sun has now begun to show her dimmer side in lower sky and these sons of God are left in silhouette. 
			"
		)
		
		if knowsOfSon:
			await writeNormal(
				"
Do you tell them what the wanderer said of the new Son of God?
	1. Yes
	2. No
				"
			)
			opt = await getopt([1,2])
			
			if opt == 1:
				await writeNormal(
					"
	'Actually,' you say, 'this wanderer revealed to me some of what happened in the Center this failing day. \"God has a new Son,\" he claimed, with particular importance I might add. I know not how he came to this knowledge.... but I believe it to be true.'
					"
				)
				
				await cont1(
					"
1. Continue
					"
				)
				
				await writeNormal(
					"
	Your companions are shocked out of words, no utterance but they peer at the ground about them and to each other. Shoulders turn towards the Center, eyes longing in directions there and away.
					"
				)
				tellsAboutSon = true
			if opt == 2:
				await writeNormal(
					"
	You further hold your tongue about this new Son of God.
					"
				)
				tellsAboutSon = false
				pass

		await writeNormal(
			"
What do you do now?
	1. Return to the center
	2. Continue your journey
			"
		)
		
		opt = await getopt([1,2])
		
		
		
		if opt == 1:
			await headBack()
		if opt == 2:
			await stayPut()
		
	if optCopy == 2: # Look towards the center
		await writeNormal(
		"
	You take to your wings and soar to great heights to investigate the Center. The eyes angelic contract far distance. 
	The sun is embattled now for her greatness in the sky at the center, though she still the victor. A second light thus joins the horizon where the Center the Lord Above inhabits. Four white towers there now reside about a great central chamber out of which points His vision. A great stair approaches from the East to this new hill. 
	
	'God hath made construction, meseems,' you say to your companions, 'I know not.'
		")
		
		await cont1()
		
		if appreciationOfNature:
			await writeNormal(
				"
	The construction strikes dismay at your heart, 'We are possessors of such great beauty here in this land and our Lord manipulates the center such? I cannot sanction it and I doubt greatly I and God align on this appreciation.'
				"
			)
		
		await writeNormal(
			"
	BELIAL fairly asks, 'Is it a new temple for himself?'
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
	await writeNormal(
		"
	LUCIFER and his allies BEEZLEBUB, MOLOCH, and BELIAL decide to aim their journey back towards the Center. As they grow closer so warms their hearts yet they remain uneasy. A light not that of the sun you see in the distance now. 
		"
	)
	
	await cont1(
		"
1. Continue
		"
	)
	
	await writeNormal(
		"
	A cold warmth rises in your core as you approach the center, yet what was the center is no more. This insincere warmth a lie and an unmet expectation--warmth since they expect it and lie to themselves that is there, cold since it is gone. 
	Great construction now takes the place of the center, a resplendent cataract feeding a gorge now filled, destroyed, removed for now a temple or a home surrounded by four terrific towers, focusing the eye of God. 
		"
	)
	
	await cont1(
		"
1. Continue
		"
	)
	
	await writeNormal(
		"
	ABDIEL, fervent worshipper of God, approaches on foot now, announcing thus: 'LUCIFER! God has had His fill of our love and has rewarded us! A new Lord, physical in form and a place from which to see Him and worship. He is God's Greater Glory--The Son, his only son, an embodiment of all angelic faith!'
	Merry, ABDIEL passes by the companions without another word. 
		"
	)
	
	await cont1(
		"
1. Our fears confirmed
		"
	)
	
	await writeNormal(
		"
	'Our God supplanted by another,' you say to your companions, 'does His form now bring us closer to God? And at what cost? A new master--a second master. Our status as God's sons betrayed. And at the cost of beauty of center?'
	Your companions think similarly, they had been spurned by God, whom they had trusted implicitly. 
	
	
	That Abdiel, fervent loyalist
	
	
	
	
	PARADISE      WILL      BE      LOST
		"
	)
	pass

# attend, cataclysm, {rise into air, split up investigate}, stay put
func stayPut() -> void: 
	await writeNormal(
		"
	LUCIFER, BEEZLEBUB, MOLOCH, and BELIAL decide to refrain or else delay their return. Is it fear they hold of learning the truth, or of the Almighty?
		"
	)
	
	if knowsOfSon and not tellsAboutSon:
		await writeNormal(
			"
And for whatever reason you choose not to tell your companions about this new Son.
			"
		)
	
	if tellsAboutSon:
		await writeNormal(
			"
The knowledge of this new Son certainly influenced your decision to continue your journey. 
			"
		)
	
	await cont1(
		"
1. Continue
		"
	)
	
	await writeNormal(
		"
	The companions stay awhile contemplating their situation. Eventually they gather themselves and travel on from that cataclysmic site. Time away from the Center cools their hearts and heightens distrust, for He is far away now and what He may have shared strikes alarm to their cores. 
		"
	)
	
	await cont1(
		"
1. Continue
		"
	)
	
	await writeNormal(
		"
	Far off now appears a messenger of God, ABDIEL, fervent in his faith. In your distrust, you hide for a moment. ABDIEL's eye cannot find you and your companions among the thick brush. All the same, he announces:
		'LUCIFIER, I wish to find thee and with thee thy companions angelic of BEEZLEBUB, MOLOCH, and BELIAL. God has made miraculous! The Son! He takes form material. The Son is his Greater Glory!' ABDIEL continues and then leaves.
		"
	)
	
	await cont1(
		"
1. Flee
		"
	)
	
	text.w = "
	The fears of these angelic friends now real
	does cast the seeds of 'spiracy. The rot,
	distrust of former promise poisons mind,
	the future actions boldly dared against
	His Holy Name. The time away will feed
	this rebel flame, will brew that fatal drink,
	though courage greatly grow substantial away
	for such a time--unhurriedly grows this fight.
	
	
	PARADISE      WILL      BE      LOST
	
	
	
	The End
	
	Press q to play again
		
		"
	text.writeFromStart()


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


