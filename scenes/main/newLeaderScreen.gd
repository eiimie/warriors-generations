extends Control

# for the label displaying leader's name
@onready var nameInput = $userInsertNewLeaderPrefix_TextEdit
@onready var displayName = $newLeaderName_Label
@onready var submitButton = $confirmPrefix_Button

# sex option chosen
@onready var chosenSex = $newLeader_pickSex_Dropdown
@onready var chosenColour = $newLeader_pickColour_Dropdown
@onready var tabbyButton = $newLeader_pickIfTabby_Dropdown
@onready var isTabby = $newLeader_pickIfTabby_Dropdown
@onready var chosenWhite = $whitenessSlider_Slider
@onready var geneticCode = "0000220002186"

# sex icon
@onready var sexIcon = $"../sexIcon"
@onready var sex = 0 # default is male 
@onready var sexText = $"../starclanMenu/VBoxContainer2/changeSex"

# call to catGeneration.gd because a function of it needs to be used when
# changing a leader's base colour (specifically when changing their leather)
@onready var genetics = preload("res://scripts/characters/catGeneration.gd")

# cat portrait initialisation 
@onready var portrait = $catPortrait_LeaderInstance

# get eyes ready
const EYE_PIGMENT = 11 
const EYE_REFRACTION = 12

# get whiteness ready
@onready var whitenessBtn = $"../starclanMenu/VBoxContainer2/changeWhiteness"
@onready var currentWhiteIndex = 0
@onready var whitenessLevels = [
	{"id": 0, "name": "no white"},
	{"id": 1, "name": "slightly white"},
	{"id": 2, "name": "slightly white"},
	{"id": 3, "name": "moderately white"},
	{"id": 4, "name": "moderately white"},
	{"id": 5, "name": "moderately white"},
	{"id": 6, "name": "mostly white"},
	{"id": 7, "name": "mostly white"},
	{"id": 8, "name": "mostly white"},
	{"id": 9, "name": "fully white"},
]

# get coat colours ready
@onready var coatColours = [
	{"id": 0, "name": "black", "female_only": false},
	{"id": 1, "name": "grey", "female_only": false},
	{"id": 2, "name": "chocolate", "female_only": false},
	{"id": 3, "name": "cinnamon", "female_only": false},
	{"id": 4, "name": "lilac", "female_only": false},
	{"id": 5, "name": "fawn", "female_only": false},
	{"id": 6, "name": "ginger", "female_only": false},
	{"id": 7, "name": "cream", "female_only": false},
	{"id": 8, "name": "black tortie", "female_only": true},
	{"id": 9, "name": "chocolate tortie", "female_only": true},
	{"id": 10, "name": "cinnamon tortie", "female_only": true},
	{"id": 11, "name": "grey tortie", "female_only": true},
	{"id": 12, "name": "lilac tortie", "female_only": true},
	{"id": 13, "name": "fawn tortie", "female_only": true},
]
@onready var currentCoatIndex = 0
@onready var coatColourLabel = $"../starclanMenu/VBoxContainer2/changeColour" 

# tabby option initialisation:
var tabbyOptions = [
	{"name": "solid", "id": 0},
	{"name": "tabby", "id": 2}
]

@onready var currentTabbyIndex = 0

# sex toggle button texture initialisation
@onready var sexToggleBtn := $"../starclanMenu/changeSexButton"
var maleIcon = preload("res://assets/images/maleSex.png")
var femaleIcon = preload("res://assets/images/femaleSex.png")

func updateCoatColourDisplay() -> void:
	var coat = coatColours[currentCoatIndex]
	coatColourLabel.text = coat["name"]
	var coatID = coatColours[currentCoatIndex]["id"]

	# Reset some genes first
	updateGeneticCode(2, "0")
	updateGeneticCode(3, "0")
	updateGeneticCode(4, "0")
	updateGeneticCode(5, "0")
	tabbyButton.set_item_disabled(0, false)

	if coatID == 6 or coatID == 7:
		# red/ginger or cream
		updateGeneticCode(2, str(randi_range(0, 5))) # random eumelanin
		updateGeneticCode(3, "1") # red gene on
		if coatID == 7:
			# cream (dilute red)
			updateGeneticCode(4, "2")
		# red cats must be tabby
		updateGeneticCode(5, "2")
		tabbyButton.set_item_disabled(0, true) # disable solid

	else:
		# Not red
		updateGeneticCode(3, "0") # red gene off
		match coatID:
			0, 1:
				# black or grey
				updateGeneticCode(2, "0") # eumelanin black
				if coatID == 1:
					# grey is dilute black
					updateGeneticCode(4, "2")
			2, 4:
				# chocolate or lilac
				updateGeneticCode(2, "3") # eumelanin brown
				if coatID == 4:
					updateGeneticCode(4, "2") # lilac is dilute chocolate
			3, 5:
				# cinnamon or fawn
				updateGeneticCode(2, "5") # eumelanin cinnamon
				if coatID == 5:
					updateGeneticCode(4, "2") # fawn dilute cinnamon
			8:
				# black tortie (black & red)
				updateGeneticCode(2, "0") # eumelanin black
				updateGeneticCode(4, "0") # no dilute
				updateGeneticCode(3, "2") # tortie gene
			9:
				# chocolate tortie
				updateGeneticCode(2, "3") # eumelanin brown
				updateGeneticCode(4, "0") # no dilute
				updateGeneticCode(3, "2") # tortie
			10:
				# cinnamon tortie
				updateGeneticCode(2, "5") # eumelanin cinnamon
				updateGeneticCode(4, "0") # no dilute
				updateGeneticCode(3, "2") # tortie
			11:
				# grey tortie (dilute black)
				updateGeneticCode(2, "0") # eumelanin black
				updateGeneticCode(4, "2") # dilute
				updateGeneticCode(3, "2") # tortie
			12:
				# lilac tortie (dilute brown)
				updateGeneticCode(2, "3") # eumelanin brown
				updateGeneticCode(4, "2") # dilute
				updateGeneticCode(3, "2") # tortie
			13:
				# fawn tortie (dilute cinnamon)
				updateGeneticCode(2, "5") # eumelanin cinnamon
				updateGeneticCode(4, "2") # dilute
				updateGeneticCode(3, "2") # tortie
			_:
				# default fallback - black
				updateGeneticCode(2, "0")
	print("Final genetic code before leather calculation: ", geneticCode)
	var eumelanin = geneticCode[2]
	var dilution = geneticCode[4]
	var red = geneticCode[3]
	print("Using eumelanin: ", eumelanin, ", dilution: ", dilution, ", red: ", red)
	var newLeather = genetics.determineLeatherColour(eumelanin, dilution, red)
	print("Calculated leather color: ", newLeather)
	updateGeneticCode(10, str(newLeather))

func validateCoatForSex() -> void:
	if sex == 0 and coatColours[currentCoatIndex]["female_only"]:
		# current coat invalid for male; switch to first non-female only coat
		for i in range(coatColours.size()):
			if not coatColours[i]["female_only"]:
				currentCoatIndex = i 
				break
		updateCoatColourDisplay()

# make an instance of Leader with placeholder values
var leaderCat = Leader.new()

func _ready():
	# play bgm main menu music
	var bgm = AudioManager.get_node("bgm_mainMenu")
	if not bgm.playing:
		bgm.play()
	
	sexIcon.texture = preload("res://assets/images/maleSex.png")
	
	leaderCat.lives = 9
	leaderCat.sex = 0
	leaderCat.age = randi_range(13,20)
	leaderCat.rank = 0
	leaderCat.genetic_code = "0000220002186"
	leaderCat.prefix = "Aster"
	leaderCat.suffix = "star"
	leaderCat.name = leaderCat.prefix + leaderCat.suffix


func _process(delta: float) -> void:
	$DEBUGDELETELATER_GENETICCODE.text = geneticCode
	$newLeader_AllegianceDescription_Label.text = Appearance.describeThisCat(geneticCode)

func updateGeneticCode(index: int, value: String) -> void:
	#debug...
	if index == 5: 
		print("Tabby gene changing from ", geneticCode[5], "to ", value)
	geneticCode = geneticCode.substr(0, index) + value + geneticCode.substr(index + 1)
	portrait.displayCat(geneticCode)
	leaderCat.genetic_code = geneticCode

func _newLeader_on_setNewPrefix_button_pressed() -> void:
	AudioManager.get_node("buttonClick").play() # play button click noise
	var newPrefix = nameInput.text.strip_edges()
	displayName.text = newPrefix + "star"
	leaderCat.prefix = newPrefix

func _on_confirmColour_button_pressed() -> void:
	AudioManager.get_node("buttonClick").play() # play button click noise
	# first, reset previous colour.
	updateGeneticCode(2, "0")
	updateGeneticCode(3, "0")
	updateGeneticCode(4, "0")
	updateGeneticCode(5, "0")
	tabbyButton.set_item_disabled(0, false)
	
	if chosenColour.get_selected_id() == 6 or chosenColour.get_selected_id() == 7:
		# red cat - set to red and dilute if necessary, then randomise the black gene
		updateGeneticCode(2, str(randi_range(0, 5)))
		updateGeneticCode(3, "1")
		if chosenColour.get_selected_id() == 7:
			# red, but specifically cream
			updateGeneticCode(4, "2")
		# because it's red/ginger, cat HAS to be tabby. red/ginger cats be always tabbies
		updateGeneticCode(5, "2")
		
		# disable "solid" option
		tabbyButton.set_item_disabled(0, true)
	else: 
		updateGeneticCode(3, "0") # not red
		match chosenColour.get_selected_id():
			0, 1:
				# black OR grey
				updateGeneticCode(2, "0")
				if chosenColour.get_selected_id() == 1: 
					# grey/blue cat chosen; needs to be dilute 
					updateGeneticCode(4, "2")
			2, 4:
				# chocolate or lilac
				updateGeneticCode(2, "3")
				if chosenColour.get_selected_id() == 4:
					# lilac chosen; needs to be dilute
					updateGeneticCode(4, "2")
			3, 5:
				# cinnamon or fawn
				updateGeneticCode(2, "5")
				if chosenColour.get_selected_id() == 5:
					# fawn chosen; needs to be dilute
					updateGeneticCode(4, "2")
			8:
				# tortie; 8 = black(0) & red
				updateGeneticCode(2, "0") # set eumel to black
				updateGeneticCode(4, "0") # set to NO dilute
				updateGeneticCode(3, "2") # set to tortie
			9: 
				# tortie; 9 = brown (3) & red
				updateGeneticCode(2, "3") # set eumel to brown
				updateGeneticCode(4, "0") # set to NO dilute
				updateGeneticCode(3, "2") # set to tortie
			10:
				# tortie; 10 = black(0) & red WITH DILUTE(2)
				updateGeneticCode(2, "0") # set eumel to black
				updateGeneticCode(4, "2") # set to dilute
				updateGeneticCode(3, "2") # set to tortie
			11: 
				# tortie; 11 = brown (3) & red & DILUTE
				updateGeneticCode(2, "3") # set eumel to brown
				updateGeneticCode(4, "2") # set to dilute
				updateGeneticCode(3, "2") # set to tortie
	# update leather colour based on pelt colour...
	var eumelanin = geneticCode[2]
	var dilution = geneticCode[4]
	var red = geneticCode[3]
	var newLeather = genetics.determineLeatherColour(eumelanin, dilution, red)
	updateGeneticCode(10, str(newLeather))
	print("----------- New leather coloUr: ", newLeather)

func _on_confirm_ifTabby_button_pressed() -> void:
	AudioManager.get_node("buttonClick").play() # play button click noise
	if isTabby.get_selected_id() == 0:
		# solid chosen
		updateGeneticCode(5, "0")
	else: 
		# tabby chosen
		updateGeneticCode(5, "2")

func _on_confirm_whiteness_button_pressed() -> void:
	AudioManager.get_node("buttonClick").play() # play button click noise
	var howWhite = str(int(chosenWhite.value))
	updateGeneticCode(9, howWhite) 

func _on_leaderIsNowReady_button_pressed() -> void:
	AudioManager.get_node("buttonClick").play() # play button click noise
	# confirm all options
	_newLeader_on_setNewPrefix_button_pressed()
	_on_confirmColour_button_pressed()
	_on_confirm_ifTabby_button_pressed()
	_on_confirm_whiteness_button_pressed()
	leaderCat.name = leaderCat.prefix + leaderCat.suffix
	
	Global.leaderCat = leaderCat
	
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_coatColourButton_pressed() -> void:
	AudioManager.get_node("buttonClick").play() # play button click noise
	var startIndex = currentCoatIndex
	var found = false
	
	while true:
		currentCoatIndex = (currentCoatIndex + 1) % coatColours.size()
		
		# if male and next coat is female only, skip it 
		if sex == 0 and coatColours[currentCoatIndex]["female_only"]:
			if currentCoatIndex == startIndex:
				# looped around without finding a valid coat, break
				break
			continue
		
		found = true
		break
	if found:
		updateCoatColourDisplay()
	updateGeneticCode(5, str(tabbyOptions[currentTabbyIndex]["id"]))

func _on_changeSexButton_pressed() -> void:
	AudioManager.get_node("buttonClick").play() # play button click noise
	
	# if 0 (male) becomes 1 (female), else 0 
	sex = 1 if sex == 0 else 0 
	
	# update button text
	sexText.text = "male" if sex == 0 else "female"
	sexIcon.texture = preload("res://assets/images/maleSex.png") if sex == 0 else preload("res://assets/images/femaleSex.png")
	
	# update leader & genetic code
	leaderCat.sex = sex
	updateGeneticCode(0, str(sex))

	
	pass # Replace with function body.


func _on_changeWhiteness_pressed() -> void:
	AudioManager.get_node("buttonClick").play() # play button click noise
	
	# first, reset previous white value 
	updateGeneticCode(9, "0")
	# not white : 0
	# slightly white : 1, 2 
	# moderately white : 3, 4, 5
	# mostly white :  6, 7, 8 
	# fully white : 9 
	
	currentWhiteIndex = (currentWhiteIndex + 1) % whitenessLevels.size()
	
	# update button text to whatever is currently selected
	var currentWhite = whitenessLevels[currentWhiteIndex]
	whitenessBtn.text = currentWhite["name"]
	var whiteID = whitenessLevels[currentWhiteIndex]["id"]
	
	var whiteStartIndex = currentWhiteIndex
	
	# change button text 
	match whiteID:
		"0": 
			whitenessBtn.text = "not white"
		"1", "2":
			whitenessBtn.text = "slightly white"
		"3", "4", "5":
			whitenessBtn.text = "moderately white"
		"6", "7", "8":
			whitenessBtn.text = "mostly white"
		"9":
			whitenessBtn.text = "fully white"
	updateGeneticCode(9, str(whiteID)) # update genetic code with new whiteness value


func _on_finishedCreatingButton_pressed() -> void:
	AudioManager.get_node("buttonClick").play() # play button click noise
	# confirm all options
	leaderCat.name = leaderCat.prefix + leaderCat.suffix
	
	Global.leaderCat = leaderCat
	
	get_tree().change_scene_to_file("res://scenes/main/game.tscn")
	AudioManager.get_node("pageTurn").play() #play page turn noise


func _on_changeTabbyBtn_pressed() -> void:
	AudioManager.get_node("buttonClick").play() # play button click noise
	
	# first check if cat is RED or CREAM - must always be tabby if they are!
	var red = geneticCode[3]
	if red == "1":
		# not tabby
		currentTabbyIndex = 1 
		updateGeneticCode(5, "2")
		$"../starclanMenu/VBoxContainer2/changeTabby".text = tabbyOptions[1]["name"]
		return
	# cycle thru tabby options
	currentTabbyIndex = (currentTabbyIndex + 1) % tabbyOptions.size()
	
	# update button text to current option name
	$"../starclanMenu/VBoxContainer2/changeTabby".text = tabbyOptions[currentTabbyIndex]["name"]
	
	# update genetic code with current option 
	updateGeneticCode(5, str(tabbyOptions[currentTabbyIndex]["id"]))

func _on_changeEyeColourBtn_pressed() -> void:
	AudioManager.get_node("buttonClick").play() # play button click noise

func _on_changeFurLengthBtn_pressed() -> void:
	AudioManager.get_node("buttonClick").play() # play button click noise


func _on_changeEyeColour_slider_value_changed(value: float) -> void:	
	var index = int(round(value))
	index = clamp(index, 0, 62)
	
	# convert index into pigment and refraction 
	var pigment: int = (index / 7) + 1 # 9 total pigment levels 
	var refraction: int = index % 7 # modulo. 7 total levels
	
	#update genetic code 
	updateGeneticCode(EYE_PIGMENT, str(pigment))
	updateGeneticCode(EYE_REFRACTION, str(refraction))


func _on_randomise_button_pressed() -> void:
	# randomise everything about leader - excluding name
	# so sex, appearance
	AudioManager.get_node("buttonClick").play() # play button click noise
	
	# randomise sex
	sex = randi_range(0,1)
	leaderCat.sex = sex
	updateGeneticCode(0, str(sex))
	sexIcon.texture = preload("res://assets/images/maleSex.png") if sex == 0 else preload("res://assets/images/femaleSex.png")
	sexText.text = "male" if sex == 0 else "female"

	
	# randomise coat colour 
	var validCoats = coatColours.filter(func(c): return not c["female_only"] or sex == 1)
	var randomCoat = validCoats[randi_range(0, validCoats.size() - 1)]
	for i in range(coatColours.size()):
		if coatColours[i]["id"] == randomCoat["id"]:
			currentCoatIndex = i
			break
	updateCoatColourDisplay()
	#_on_confirmColour_button_pressed()
	
	# randomise tabby
	currentTabbyIndex = randi_range(0, tabbyOptions.size() - 1)
	var tabbyID = tabbyOptions[currentTabbyIndex]["id"]
	updateGeneticCode(5, str(tabbyID))
	$"../starclanMenu/VBoxContainer2/changeTabby".text = tabbyOptions[currentTabbyIndex]["name"]
	
	# randomise whiteness level
	var weighted_white_ids = [
		0, 0, 0, 0,      # no white (common)
		1, 1, 1,         # slightly white
		2, 2,            # slightly white
		3, 3,            # moderately white
		4,               # moderately white
		5,               # moderately white
		6,               # mostly white
		7,               # mostly white
		8,               # mostly white
		9                # fully white (very rare)
	]

	var whiteID = weighted_white_ids[randi_range(0, weighted_white_ids.size() - 1)]

	# Now find the index in `whitenessLevels` that matches this ID
	for i in range(whitenessLevels.size()):
		if whitenessLevels[i]["id"] == whiteID:
			currentWhiteIndex = i
			break

	updateGeneticCode(9, str(whiteID))
	whitenessBtn.text = whitenessLevels[currentWhiteIndex]["name"]
	
	# randomise eye colour
	var index = randi_range(0, 62)
	var pigment: int = (index / 7) + 1 
	var refraction: int = index % 7 
	updateGeneticCode(EYE_PIGMENT, str(pigment))
	updateGeneticCode(EYE_REFRACTION, str(refraction))
	
	leaderCat.prefix = nameDB.randomPrefix(Appearance.describeThisCatsAppearance(leaderCat.genetic_code))
	$newLeaderPrefix_textEdit.text = leaderCat.prefix


func _on_prefixInput_text_submitted(newPrefix: String) -> void:
	AudioManager.get_node("buttonClick").play() # play button click noise
	newPrefix = newPrefix.strip_edges()
	if newPrefix == "":
		return # ignore empty input
	
	# format the new prefix correctly 
	newPrefix = newPrefix[0].to_upper() + newPrefix.substr(1).to_lower()
	
	# save as new prefix
	leaderCat.prefix = newPrefix
	print("Debug: new name is", newPrefix + "star. Yippee!")

func _on_randomisePrefixButton_pressed() -> void:
	AudioManager.get_node("buttonClick").play() # play button click noise
	leaderCat.prefix = nameDB.randomPrefix(Appearance.describeThisCatsAppearance(leaderCat.genetic_code))
	$newLeaderPrefix_textEdit.text = leaderCat.prefix

#func _on_changeSex_button_pressed() -> void:
	#AudioManager.get_node("buttonClick").play()
	#var currentSex = int(geneticCode[Enums.GenePosition.SEX])
	#var newSex = 1 - currentSex
	#updateGeneticCode(Enums.GenePosition.SEX, str(newSex))
	
	# update the leaderCat object
	#leaderCat.sex = newSex
	
	# validate coat for new sex (in case switching from female to male with tortie coat)
	#validateCoatForSex()
