extends Control

var moonCount = 0 
@onready var leaderDisplay = $leaderDisplay
@onready var clanMembersDisplay = $clanMembersVBox

var myLeader = Global.leaderCat

func _ready():
	updateMoonCounter()
	myLeader.printInfo()
	leaderDisplay.displayMember(myLeader)
	
func updateMoonCounter():
	$moonCounterLabel.text = "Moons: " + str(moonCount)
	myLeader.age += 1
	leaderDisplay.displayMember(myLeader)
	#for cat in playerClan.getAllCats():
	#	cat.age += 1
	# now refresh the display
	#for display in clanMembersDisplay.get_children():
	#	display.displayMember(Global.playerClan.getCat(display.cat_id))

func on_Game_backToMainMenu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")

func _on_nextMoonButton_pressed():
	moonCount += 1
	updateMoonCounter()

func displayClanMembers(clan: Array):
	for member in clan: 
		var card = preload("res://scenes/memberDisplay.tscn").instantiate()
		card.set_data(member)
		clanMembersDisplay.add_child(card)
