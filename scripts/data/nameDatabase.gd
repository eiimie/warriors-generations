extends Node

var nameDatabase := {}

func _ready() -> void:
	loadNameData()

func loadNameData() -> void:
	var file = FileAccess.open("res://scripts/data/nameData.json", FileAccess.READ)
	if file:
		nameDatabase = JSON.parse_string(file.get_as_text())
	else:
		push_error("Failed to load nameData.json")

func getPrefixes(category: String) -> Array:
	return nameDatabase.get("prefixes", {}).get(category, [])

func getAllPrefixes() -> Array:
	var all = []
	for arr in nameDatabase.get("prefixes", {}).values():
		all += arr
	return all

func getSuffixes() -> Array:
	return nameDatabase.get("suffixes", [])

func randomSuffix() -> String:
	return getSuffixes().pick_random()

func randomPrefix(appearance: String) -> String:
	var list = getPrefixes(appearance)
	if list.is_empty():
		push_error("Invalid appearance category passed to randomPrefix: %s" % appearance)
		return getPrefixes("brown").pick_random() # fallback
	return list.pick_random()
