extends Node

# preload suffixes
const Suffixes = preload("res://Scripts/names_suffix.gd")
const prefixes = preload("res://Scripts/names_prefix.gd")


static var rng = RandomNumberGenerator.new()
#var sex = rng.randi_range(0,1)

# this class creates random names for cats, specifically generating warrior names, prefixes, and suffixes.
# this requires a given genetic code

# generates a full warrior name from prefixes and suffixes
# returns warriorName 
func generateWarriorName(appearance: String) -> String: 
	var warriorPrefix = generatePrefix(appearance)
	var warriorSuffix = generateSuffix()
	return warriorPrefix + warriorSuffix

# generates a prefix, returns warriorPrefix
func generatePrefix(appearance: String) -> String:
	var warriorPrefix
	# appearances: white, bi, tri, brown, black, red, golden, pattern
	#lists: prefixes_black, prefixes_blue, prefixes_brown, prefixes_red, prefixes_golden, prefixes_bi, prefixes_tri, prefixes_pattern, prefixes_white
	
	var prefixes = prefixes.new()
	
	match appearance:
		"white":
			warriorPrefix = prefixes.prefixes_white[rng.randi_range(0, prefixes.prefixes_white.size() - 1)]
		"bi":
			warriorPrefix = prefixes.prefixes_bi[rng.randi_range(0, prefixes.prefixes_bi.size() - 1)]
		"tri":
			warriorPrefix = prefixes.prefixes_tri[rng.randi_range(0, prefixes.prefixes_tri.size() - 1)]
		"brown":
			warriorPrefix = prefixes.prefixes_brown[rng.randi_range(0, prefixes.prefixes_brown.size() - 1)]
		"black":
			warriorPrefix = prefixes.prefixes_black[rng.randi_range(0, prefixes.prefixes_black.size() - 1)]
		"red":
			warriorPrefix = prefixes.prefixes_red[rng.randi_range(0, prefixes.prefixes_red.size() - 1)]
		"golden":
			warriorPrefix = prefixes.prefixes_golden[rng.randi_range(0, prefixes.prefixes_golden.size() - 1)]
		_:
			warriorPrefix = prefixes.prefixes_pattern[rng.randi_range(0, prefixes.prefixes_pattern.size() - 1)] 	
	return warriorPrefix

# generates a suffix, returns warriorSuffix 
# tested and is working as intended
func generateSuffix() -> String: 
	var suffixes_list = Suffixes.new().get_suffixes()
	return suffixes_list[rng.randi_range(0, suffixes_list.size() - 1)]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
