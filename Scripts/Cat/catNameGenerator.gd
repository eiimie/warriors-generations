extends Node

# preload suffixes and prefixes
const Suffixes = preload("res://Scripts/names_suffix.gd")
const Prefixes = preload("res://Scripts/names_prefix.gd")

static var rng = RandomNumberGenerator.new()

# Generates a full warrior name
func generateWarriorName(appearance: String) -> String:
	var warriorPrefix = generatePrefix(appearance)
	var warriorSuffix = generateSuffix()
	return warriorPrefix + warriorSuffix

# Generates a prefix based on appearance
func generatePrefix(appearance: String) -> String:
	var prefix_map = {
		"white": Prefixes.prefixes_white,
		"bi": Prefixes.prefixes_bi,
		"tri": Prefixes.prefixes_tri,
		"brown": Prefixes.prefixes_brown,
		"black": Prefixes.prefixes_black,
		"red": Prefixes.prefixes_red,
		"golden": Prefixes.prefixes_golden,
		"pattern": Prefixes.prefixes_pattern
	}
	var prefixes_list = prefix_map.get(appearance, Prefixes.prefixes_pattern)
	return prefixes_list[rng.randi_range(0, prefixes_list.size() - 1)]

# Generates a suffix
func generateSuffix() -> String:
	var suffixes_instance = Suffixes.new()  # create an instance of the preloaded script, suffixes
	var suffixes_list = suffixes_instance.get_suffixes()  # call the non-static method
	return suffixes_list[rng.randi_range(0, suffixes_list.size() - 1)]

# Called when the node enters the scene tree
func _ready() -> void:
	rng.randomize() # helps rng be more random :)
