extends Control

var moonCount = 0 
@onready var leaderDisplay = $leaderDisplay
@onready var clanMembersDisplay = $ScrollContainer/clanMembersVBox
var clan

var myLeader = Global.leaderCat

func _ready():
	clan = playerClan.new() # create an instance of the clan
	updateMoonCounter()
	myLeader.printInfo()
	leaderDisplay.displayMember(myLeader)
	
	var allCats = clan.getAllCats()
	for cat in allCats:
		var memberDisplay = preload("res://scenes/characters/memberDisplay.tscn").instantiate()
		#memberDisplay.displayMember(cat)
		clanMembersDisplay.add_child(memberDisplay)
	
	# deubg - testing suffixes and prefixes
	print("4 Random suffixes -- ")
	for x in range(4):
		print(Global.randomSuffix())
	
	print("Random prefixes -- ")
	print("Black: ", Global.randomPrefix("black"))
	print("Blue: ", Global.randomPrefix("blue"))
	print("Brown: ", Global.randomPrefix("brown"))
	print("Red: ", Global.randomPrefix("red"))
	print("Golden: ", Global.randomPrefix("golden"))
	print("Bi: ", Global.randomPrefix("bi"))
	print("Tri: ", Global.randomPrefix("tri"))
	print("Pattern: ", Global.randomPrefix("pattern"))
	print("White: ", Global.randomPrefix("white"))

# quick refresh the container displaying cat members
func refreshAllCatDisplays():
	print("All cats:", clan.getAllCats())
	# clear old children
	for child in clanMembersDisplay.get_children():
		child.queue_free()
	
	await get_tree().process_frame # let godot clean them up
	
	# add all again
	for cat in clan.getAllCats():
		var memberDisplay = preload("res://scenes/characters/memberDisplay.tscn").instantiate()
		memberDisplay.call_deferred("displayMember", cat)
		clanMembersDisplay.add_child(memberDisplay)
	
func updateMoonCounter():
	$moonCounterLabel.text = "Moons: " + str(moonCount)
	myLeader.age += 1
	leaderDisplay.displayMember(myLeader)
	clan.ageUpAllCats(clan)
		#for cat in playerClan.getAllCats():
	#	cat.age += 1
	# now refresh the display
	#for display in clanMembersDisplay.get_children():
	#	display.displayMember(Global.playerClan.getCat(display.cat_id))

func on_Game_backToMainMenu_button_pressed():
	AudioManager.get_node("buttonClick").play() # play button click noise
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")

func _on_nextMoonButton_pressed():
	AudioManager.get_node("buttonClick").play() # play button click noise
	moonCount += 1
	updateMoonCounter()
	refreshAllCatDisplays()

func displayClanMembers(clan: Array):
	for member in clan: 
		var card = preload("res://scenes/characters/memberDisplay.tscn").instantiate()
		card.set_data(member)
		clanMembersDisplay.add_child(card)


func _on_open_debug_menu_pressed() -> void:
	# open debug menu 
	pass # Replace with function body.


func _on_debug_addRandomCat_button_pressed() -> void:
	# Add test cats to the clan
	var id = clan.getNewCatID()
	var name = "TestCat"
	var sex = randi() % 2
	var age = randi() % 10 + 1
	var rank = 3  # Avoid leader (0) for now
	var gen_code = Genetics.ranGenCat_NotWeighted()
	var prefix = "Prefix"
	var suffix = "Suffix"
	var isPregnant = false
	var pregProgress = 0
		
	var cat = clan.addNewCatToClan(id, name, sex, age, rank, gen_code, prefix, suffix, isPregnant, pregProgress)
	print("Added Cat: ", cat.name, " | GenCode: ", cat.genetic_code)

func _on_debug_checkClan_button_pressed() -> void:
	print(clan.getAllCats())
