extends Resource

class_name Suffixes

# define the default suffixes list
var suffixes_default: Array = [
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

# function to retrieve the suffixes
func get_suffixes() -> Array:
	return suffixes_default

# function to add a new suffix to the list
func add_suffix(suffix: String) -> void:
	if suffix not in suffixes_default:
		suffixes_default.append(suffix)

# function to check if a suffix exists in the list
func has_suffix(suffix: String) -> bool:
	return suffix in suffixes_default
