extends Node

var currentMoon = 0
var livingCatCount = 0

var leaderCat: Leader

#var living_cats: Array = []
#var dead_cats: Array = []

func incrementMoon():
	currentMoon += 1
	for cat in PlayerClan.getAllCats():
		cat.age += 1
		# Add logic for rank progression, births, deaths, etc.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.

func _incrementMoon() -> void:
	currentMoon += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func randomSuffix() -> String:
	return nameDB.randomSuffix()

func randomPrefix(appearance) -> String:
	return nameDB.randomPrefix(appearance)
