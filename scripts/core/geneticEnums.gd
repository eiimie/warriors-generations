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
	EYE_REFRACTION = 12 # refraction axis (0-6)
}

# INDIVIDUAL GENE ENUMS -- 

enum Sex { 
    MALE = 0,
    FEMALE = 1
}

enum FurLength {
    SHORT = 0,
    SHORT_CARRY_LONG = 1,
    LONG = 2 
}

# black pigment alleles
enum Eumelanin {
    BLACK = 0, 
    BLACK_CARRY_CHOCOLATE = 1,
    BLACK_CARRY_CINNAMON = 2,
    CHOCOLATE = 3,
    CHOCOLATE_CARRY_CINNAMON = 4, 
    CINNAMON = 5
}

enum Red {
    NOT_RED = 0, #XO
    RED = 1, # Xo
    TORTOISESHELL = 2 # XOXo females only 
}

enum Dilution { 
    NOT_DILUTE = 0,
    NOT_DILUTE_CARRY_DILUTE = 1,
    DILUTE = 2
}

enum Tabby { 
    SOLID = 0,
    SOLID_CARRY_TABBY = 1,
    TABBY = 2
}

enum TabbyPattern {
    MACKEREL = 0,
    MACKEREL_CARRY_BLOTCHED = 1,
    BLOTCHED = 2
}

# not implemented
enum Silver {
    SILVER = 0,
    SILVER_CARRY_NOT_SILVER = 1,
    NOT_SILVER = 2
}

# not implemented
enum Point { 
    NOT_POINT = 0,
    NOT_POINT_CARRY_POINT = 1,
    POINT = 2
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

# white is an integer between 0 and 9 
# eye pimgnentation also an integer within 1-9, 0 is reserved for albinism 
# eye refraction also an integer between 0 and 6