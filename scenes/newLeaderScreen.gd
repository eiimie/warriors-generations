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

# cat portrait initialisation 
@onready var portrait = $catPortrait_LeaderInstance

var geneticCode = "0001000000"
# [0] sex, 0 = male and 1 = female
# [1] furlen, 0 = short, 1 = short (long), 2 = long
# [2] eumel. 0 = black. 3 = chocolate. 5 = cinnamon.
# [3] red. 0 = not red. 1 = red. (also tortie, but n/a)
# [4] dilution. 0 = not dilute. 2 = dilute
# [5] tabby. 0 = solid. 2 = tabby
# [6] tabby pattern. 0 = mackerel. 2 = classic.
# [7] silver. 0 for now.
# [8] point. 0 for now.
# [9] whiteness level.

func _process(delta: float) -> void:
	$DEBUGDELETELATER_GENETICCODE.text = geneticCode
	$newLeader_AllegianceDescription_Label.text = Appearance.describeThisCat(geneticCode)

func updateGeneticCode(index: int, value: String) -> void:
	geneticCode = geneticCode.substr(0, index) + value + geneticCode.substr(index + 1)
	portrait.displayCat(geneticCode)

func _newLeader_on_setNewPrefix_button_pressed() -> void:
	var newPrefix = nameInput.text.strip_edges()
	displayName.text = newPrefix + "star"

func _on_confirmSex_button_pressed() -> void:
	if chosenSex.get_selected_id() == 0:
		# male selected
		updateGeneticCode(0, "0")

		# disable female-only coats (IDs 8–11)
		for i in [8, 9, 10, 11]:
			chosenColour.set_item_disabled(i, true)

		# reset only if a now-invalid option is selected
		if chosenColour.get_selected_id() in [8, 9, 10, 11]:
			chosenColour.select(0)
			_on_confirmColour_button_pressed()

	else:
		# female selected
		updateGeneticCode(0, "1")

		# enable female-only coats (IDs 8–11)
		for i in [8, 9, 10, 11]:
			chosenColour.set_item_disabled(i, false)

func _on_confirmColour_button_pressed() -> void:
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
	if isTabby.get_selected_id() == 0:
		# solid chosen
		updateGeneticCode(5, "0")
	else: 
		# tabby chosen
		updateGeneticCode(5, "2")


func _on_confirm_whiteness_button_pressed() -> void:
	var howWhite = str(int(chosenWhite.value))
	updateGeneticCode(9, howWhite) 


func _on_leaderIsNowReady_button_pressed() -> void:
	_newLeader_on_setNewPrefix_button_pressed()
	_on_confirmSex_button_pressed()
	_on_confirmColour_button_pressed()
	_on_confirm_ifTabby_button_pressed()
	_on_confirm_whiteness_button_pressed()
	get_tree().change_scene_to_file("res://scenes/game.tscn")
