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
@onready var geneticCode = "0021020000"

# sex icon
@onready var sexIcon = $"../sexIcon"
@onready var sex = 0 # default is male 
@onready var sexText = $"../starclanMenu/VBoxContainer2/changeSex"

# cat portrait initialisation 
@onready var portrait = $catPortrait_LeaderInstance

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
@onready var coatColourLabel = $"../starclanMenu/VBoxContainer2/changeColour".text 

func updateCoatColourDisplay() -> void:
	var coat = coatColours[currentCoatIndex]
	coatColourLabel = coat["name"]
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
	
	# update catPortrait

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
	leaderCat.genetic_code = "0021020000"
	leaderCat.prefix = "Aster"
	leaderCat.suffix = "star"
	leaderCat.name = leaderCat.prefix + leaderCat.suffix

func _process(delta: float) -> void:
	$DEBUGDELETELATER_GENETICCODE.text = geneticCode
	$newLeader_AllegianceDescription_Label.text = Appearance.describeThisCat(geneticCode)

func updateGeneticCode(index: int, value: String) -> void:
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
