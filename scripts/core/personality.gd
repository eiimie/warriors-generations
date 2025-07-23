extends Node

# enneagram personalities
enum personalityType {
	REFORMER, 
	HELPER,
	ACHIEVER,
	INDIVIDUALIST,
	INVESTIGATOR,
	LOYALIST,
	ENTHUSIAST,
	CHALLENGER,
	PEACEMAKER
}

# in catMember:
# var primary : int # from enum pesronalityType
# var secondary : int
# var traits : Array[String]
# var quirks : Array[String]
# var moodBias : String

# when generating a cat:
# cat.primary = randi() % PersonalityType.size()
# cat.secondary = randi() % PersonalityType.size()
# pull associated traits and quirks:
# var profile = personalityProfiles[PersonalityType.keys()[cat.primary]]
# cats.traits.append_array(profile["common_traits"].pick_random(2))
# cat.quirks.append(quirks.pick_random())
# cat.moodBias = profile["mood_bias"]

# personality - pick 1 common trait, 1 strength, and 1 weakness, combine with a quirk
# e.g. for a REFORMER - [disciplined], [responsible], [overly serious] cat who [overthinks everything]
