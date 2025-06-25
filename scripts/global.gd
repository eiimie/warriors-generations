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

# static lists for prefixes based on colours and patterns
static var prefixesBlack = [
	"Ant", "Bat", "Beetle", "Black", "Coot", "Cormorant", "Crow", "Dark", "Dipper", "Fly",
	"Ivy", "Mole", "Night", "Privet", "Rat", "Raven", "Rook", "Sledge", "Shade", "Shadow",
	"Sheep", "Sloe", "Slug", "Soot", "Spider", "Starling", "Swift"
]

static var prefixesBlue = [
	"Ash", "Aspen", "Aster", "Birch", "Bleak", "Blizzard", "Blue", "Bream", "Burdock", "Cinder",
	"Cuckoo", "Comfrey", "Crane", "Dace", "Dark", "Dove", "Evening", "Falcon", "Fir", "Fly",
	"Fog", "Gadwall", "Goose", "Grey", "Hail", "Ivy", "Juniper", "Lavender", "Minnow", "Mint",
	"Pigeon", "Pine", "Rain", "Roach", "Storm", "Sycamore", "Teasel", "Thistle", "Thrift",
	"Thrush", "Thyme", "Vervain", "Willow", "Wisteria"
]

static var prefixesBrown = [
	"Acorn", "Adder", "Alder", "Ant", "Argus", "Barley", "Bat", "Beech", "Beetle", "Bittern",
	"Boulder", "Bramble", "Brambling", "Briar", "Brown", "Buzzard", "Carp", "Cedar", "Chub",
	"Curlew", "Cypress", "Dark", "Deer", "Dipper", "Duck", "Dunnock", "Dusk", "Dust", "Eagle",
	"Eel", "Elder", "Elm", "Fallow", "Fawn", "Frog", "Goose", "Grouse", "Gudgeon", "Hare",
	"Harrier", "Hazel", "Honey", "Ivy", "Jay", "Kestrel", "Lamprey", "Larch", "Lark", "Limpet",
	"Linnet", "Lizard", "Loach", "Marten", "Mink", "Minnow", "Mosquito", "Moth", "Mouse", "Mud",
	"Muntjac", "Nightingale", "Oak", "Oat", "Otter", "Owl", "Partridge", "Pebble", "Pheasant",
	"Pipit", "Pike", "Quail", "Rabbit", "Rail", "Rat", "Reed", "Robin", "Rock", "Rudd", "Rush",
	"Rye", "Sedge", "Shell", "Shrew", "Snail", "Snake", "Sparrow", "Spider", "Stone", "Swift",
	"Tawny", "Teasel", "Tiger", "Thrush", "Toad", "Trout", "Twite", "Vole", "Weasel", "Weevil",
	"Whimbrel", "Whinchat", "Wren", "Yew"
]

static var prefixesRed = [
	"Ant", "Apple", "Asphodel", "Burnet", "Campion", "Chanterelle", "Cherry", "Cypress", "Daisy",
	"Dawn", "Fire", "Fox", "Fritillary", "Ginger", "Heather", "Holly", "Honey", "Hornet", "Lion",
	"Maple", "Marigold", "Morning", "Pear", "Plum", "Poppy", "Red", "Rose", "Rowan", "Russet",
	"Skipper", "Stoat", "Tawny", "Thrift", "Tiger", "Valerian", "Wasp", "Wisteria", "Yarrow"
]

static var prefixesGolden = [
	"Acorn", "Apple", "Asphodel", "Bee", "Carp", "Chanterelle", "Clover", "Daffodil", "Daisy",
	"Dawn", "Fennel", "Fritillary", "Golden", "Gorse", "Honey", "Hornet", "Laburnum", "Larch",
	"Leopard", "Lightning", "Lion", "Maple", "Marigold", "Morning", "Oat", "Reed", "Rush", "Rye",
	"Sand", "Tansy", "Wax", "Wasp", "Yellow"
]

static var prefixesBi = [
	"Avocet", "Badger", "Bright", "Chub", "Cuckoo", "Diver", "Duck", "Dunlin", "Godwit",
	"Gull", "Heron", "Knot", "Lamprey", "Lichen", "Loon", "Magpie", "Martin", "Mottle", "Nerite",
	"Pansy", "Patch", "Plover", "Shrike", "Swift", "Tern"
]

static var prefixesTri = [
	"Brambling", "Cherry", "Comma", "Ember", "Fritillary", "Gannet", "Kestrel", "Leech", "Leopard",
	"Lichen", "Lizard", "Maple", "Morning", "Newt", "Pansy", "Pochard", "Robin", "Shell", "Skipper",
	"Sorrel", "Sycamore", "Toad", "Trout", "Wigeon"
]

static var prefixesPattern = [
	"Adder", "Aspen", "Ash", "Avocet", "Badger", "Bee", "Birch", "Bittern", "Blizzard", "Bramble",
	"Briar", "Bright", "Brindle", "Buzzard", "Cedar", "Cuckoo", "Curlew", "Dapple", "Diver", "Duck",
	"Dunnock", "Elder", "Falcon", "Fleck", "Fly", "Frog", "Fritillary", "Gull", "Heron", "Ivy",
	"Jay", "Juniper", "Kestrel", "Kite", "Knot", "Leech", "Leopard", "Lichen", "Loach", "Loon",
	"Magpie", "Moth", "Mottle", "Nerite", "Newt", "Owl", "Patch", "Pheasant", "Pike", "Pipit",
	"Plover", "Quail", "Robin", "Salamon", "Sheep", "Shrike", "Sleet", "Slug", "Smoke", "Snail",
	"Snake", "Sparrow", "Speckle", "Spider", "Spotted", "Swallow", "Tern", "Teasel", "Tiger", "Toad",
	"Trout", "Twite", "Wasp", "Whimbrel", "Whinchat", "Wren"
]

static var prefixesWhite = [
	"Blizzard", "Campion", "Chervil", "Cloud", "Clover", "Comfrey", "Dandelion", "Daisy",
	"Egret", "Frost", "Garlic", "Hemlock", "Holly", "Laurel", "Light", "Lightning", "Lily", "Mallow",
	"Mistletoe", "Pale", "Pear", "Plum", "Privet", "Shell", "Sheep", "Sloe", "Snow/Ice", "Swan",
	"Valerian", "White", "Wisteria", "Yarrow"
]

# define the default suffixes list
var suffixesDefault: Array = [
	# separated by alphabetical order
	# these are "traditional" suffixes
	"berry", "blaze", "blossom", "breeze", "burr", 
	"claw", "cloud", 
	"dapple", "dash", "dawn", "dust", 
	"ear", "eye", 
	"face", "fall", "fang", "feather", "fern", "fire", "flame", "flower", "foot", "frost", "fur",
	"gaze", 
	"heart", 
	"jaw", 
	"mist",
	"leaf", "leap", "leg", "light", 
	"nose", 
	"pelt", "petal", "poppy", "pounce", "puddle", 
	"shine", "song", "splash", "spring", "step", "storm", "stream", "strike", "stripe", 
	"snow", "spirit", "speckle",
	"tail", "talon", "thistle", "toe", "tooth", "tuft",
	"watcher", "water", "whisker", "whisper", "willow", "wind", "wing", "wish"
]

func randomSuffix() -> String:
	return suffixesDefault.pick_random()

func randomPrefix(appearance) -> String:
	match appearance:
		"black":
			return prefixesBlack.pick_random()
		"blue":
			return prefixesBlue.pick_random()
		"brown":
			return prefixesBrown.pick_random()
		"red":
			return prefixesRed.pick_random()
		"golden":
			return prefixesGolden.pick_random()
		"bi":
			return prefixesBi.pick_random()
		"tri":
			return prefixesTri.pick_random()
		"pattern":
			return prefixesPattern.pick_random()
		"white":
			return prefixesWhite.pick_random()
		_:
			# invalid prefix passed
			print("Invalid prefix passed to randomPrefix")
			return prefixesBrown.pick_random()

# function to retrieve the suffixes
func getSuffixesList() -> Array:
	return suffixesDefault

# function to add a new suffix to the list
func addSuffixToSuffixList(suffix: String) -> void:
	if suffix not in suffixesDefault:
		suffixesDefault.append(suffix)

# function to check if a suffix exists in the list
func hasSuffixInSuffixList(suffix: String) -> bool:
	return suffix in suffixesDefault
