extends Node

var currentMoon = 0
var livingCatCount = 0

var leaderCat: Leader

#var living_cats: Array = []
#var dead_cats: Array = []

# initialising json files for personality so can be accessed globally:
var personalityProfiles = {}
var personalityQuirks = {}

func incrementMoon():
	currentMoon += 1
	for cat in PlayerClan.getAllCats():
		cat.age += 1
		# Add logic for rank progression, births, deaths, etc.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var profilesFile = FileAccess.open("res://path/personalityProfiles.json", FileAccess.READ)
	if profilesFile:
		var profilesText = profilesFile.get_as_text()
		var json = JSON.new()
		var result = json.parse(profilesText)
		if result == OK:
			personalityProfiles = json.get_data()
		else:
			print("Error parsing personalityProfiles.json")
		profilesFile.close()
	else:
		print("Error opening personalityProfiles.json")

	var quirksFile = FileAccess.open("res://path/personalityQuirks.json", FileAccess.READ)
	if quirksFile:
		var quirksText = quirksFile.get_as_text()
		var json = JSON.new()
		var result = json.parse(quirksText)
		if result == OK:
			personalityQuirks = json.get_data()["quirks"]
		else:
			print("Error parsing personalityQuirks.json")
		quirksFile.close()
	else:
		print("Error opening personalityQuirks.json")


func _incrementMoon() -> void:
	currentMoon += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func randomSuffix() -> String:
	return nameDB.randomSuffix()

func randomPrefix(appearance) -> String:
	return nameDB.randomPrefix(appearance)
