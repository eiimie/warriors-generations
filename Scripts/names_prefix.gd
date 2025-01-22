extends Resource

class_name prefixes

# Static lists for prefixes based on colors and patterns
static var prefixes_black = [
	"Ant", "Bat", "Beetle", "Black", "Coot", "Cormorant", "Crow", "Dark", "Dipper", "Fly",
	"Ivy", "Mole", "Night", "Privet", "Rat", "Raven", "Rook", "Sledge", "Shade", "Shadow",
	"Sheep", "Sloe", "Slug", "Soot", "Spider", "Starling", "Swift"
]

static var prefixes_blue = [
	"Ash", "Aspen", "Aster", "Birch", "Bleak", "Blizzard", "Blue", "Bream", "Burdock", "Cinder",
	"Cuckoo", "Comfrey", "Crane", "Dace", "Dark", "Dove", "Evening", "Falcon", "Fir", "Fly",
	"Fog", "Gadwall", "Goose", "Grey", "Hail", "Ivy", "Juniper", "Lavender", "Minnow", "Mint",
	"Pigeon", "Pine", "Rain", "Roach", "Storm", "Sycamore", "Teasel", "Thistle", "Thrift",
	"Thrush", "Thyme", "Vervain", "Willow", "Wisteria"
]

static var prefixes_brown = [
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

static var prefixes_red = [
	"Ant", "Apple", "Asphodel", "Burnet", "Campion", "Chanterelle", "Cherry", "Cypress", "Daisy",
	"Dawn", "Fire", "Fox", "Fritillary", "Ginger", "Heather", "Holly", "Honey", "Hornet", "Lion",
	"Maple", "Marigold", "Morning", "Pear", "Plum", "Poppy", "Red", "Rose", "Rowan", "Russet",
	"Skipper", "Stoat", "Tawny", "Thrift", "Tiger", "Valerian", "Wasp", "Wisteria", "Yarrow"
]

static var prefixes_golden = [
	"Acorn", "Apple", "Asphodel", "Bee", "Carp", "Chanterelle", "Clover", "Daffodil", "Daisy",
	"Dawn", "Fennel", "Fritillary", "Golden", "Gorse", "Honey", "Hornet", "Laburnum", "Larch",
	"Leopard", "Lightning", "Lion", "Maple", "Marigold", "Morning", "Oat", "Reed", "Rush", "Rye",
	"Sand", "Tansy", "Wax", "Wasp", "Yellow"
]

static var prefixes_bi = [
	"Avocet", "Badger", "Bright", "Chub", "Cuckoo", "Diver", "Duck", "Dunlin", "Godwit",
	"Gull", "Heron", "Knot", "Lamprey", "Lichen", "Loon", "Magpie", "Martin", "Mottle", "Nerite",
	"Pansy", "Patch", "Plover", "Shrike", "Swift", "Tern"
]

static var prefixes_tri = [
	"Brambling", "Cherry", "Comma", "Ember", "Fritillary", "Gannet", "Kestrel", "Leech", "Leopard",
	"Lichen", "Lizard", "Maple", "Morning", "Newt", "Pansy", "Pochard", "Robin", "Shell", "Skipper",
	"Sorrel", "Sycamore", "Toad", "Trout", "Wigeon"
]

static var prefixes_pattern = [
	"Adder", "Aspen", "Ash", "Avocet", "Badger", "Bee", "Birch", "Bittern", "Blizzard", "Bramble",
	"Briar", "Bright", "Brindle", "Buzzard", "Cedar", "Cuckoo", "Curlew", "Dapple", "Diver", "Duck",
	"Dunnock", "Elder", "Falcon", "Fleck", "Fly", "Frog", "Fritillary", "Gull", "Heron", "Ivy",
	"Jay", "Juniper", "Kestrel", "Kite", "Knot", "Leech", "Leopard", "Lichen", "Loach", "Loon",
	"Magpie", "Moth", "Mottle", "Nerite", "Newt", "Owl", "Patch", "Pheasant", "Pike", "Pipit",
	"Plover", "Quail", "Robin", "Salamon", "Sheep", "Shrike", "Sleet", "Slug", "Smoke", "Snail",
	"Snake", "Sparrow", "Speckle", "Spider", "Spotted", "Swallow", "Tern", "Teasel", "Tiger", "Toad",
	"Trout", "Twite", "Wasp", "Whimbrel", "Whinchat", "Wren"
]

static var prefixes_white = [
	"Blizzard", "Campion", "Chervil", "Cloud", "Clover", "Comfrey", "Dandelion", "Daisy",
	"Egret", "Frost", "Garlic", "Hemlock", "Holly", "Laurel", "Light", "Lightning", "Lily", "Mallow",
	"Mistletoe", "Pale", "Pear", "Plum", "Privet", "Shell", "Sheep", "Sloe", "Snow/Ice", "Swan",
	"Valerian", "White", "Wisteria", "Yarrow"
]
