extends Node

# ranks
enum Rank { 
	LEADER,
	KIT, 
	APPRENTICE,
	WARRIOR, 
	MEDICINE_CAT,
	DEPUTY,
	ELDER,
	OUTSIDER
}

# in future, move towards using geneticEnums.gd instead, and adjust code as needed
# enum-based interpretation of string-based genetic code:
enum GenePosition { 
	SEX = 0,
	FUR_LENGTH = 1,
	EUMELANIN = 2,
	RED = 3, 
	DILUTION = 4,
	TABBY = 5,
	TABBY_PATTERN = 6,
	SILVER = 7,
	POINT = 8,
	WHITE = 9, 
	LEATHER = 10,
	EYE_PIGMENT = 11, # pigmentation axis (0-9, but 0 reserved for albinism)
	EYE_REFRACTION = 12, # refraction axis (0-6)
	FUR_VARIETY = 13 # 0 = midhair, 1 = longhair
}

# leather colours
enum LeatherColour {
	BLACK = 0,
	BLUE = 1,
	DARKBROWN = 2,
	FAWN = 3,
	LILAC = 4,
	PALEFAWN = 5,
	PINK = 6,
	RED = 7,
	REDDISHBROWN = 8
}
