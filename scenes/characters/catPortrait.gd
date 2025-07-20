#catPortrait - this is the image for cats that are generated based on their genetic codes
# this code generates a catPortrait for a given genetic code.

extends Control

@onready var lineart = $Node2D/lineart
@onready var base = $Node2D/baseColour
@onready var pattern = $Node2D/pattern
@onready var white = $Node2D/white
@onready var eyes = $Node2D/eyes
@onready var leather = $Node2D/leather

func resetPortrait():
	var sprite_container = $Node2D
	for child in sprite_container.get_children():
		if child is Sprite2D:
			child.texture = null

func displayCat(geneticCode: String):
	print("displayCat called with code: ", geneticCode)
	if geneticCode.length() != 13:
		print("Invalid genetic code passed to catPortrait.displayCat")
		return
	
	#resetPortrait()

	var eumelanin = geneticCode[2]
	var red = geneticCode[3]
	var dilution = geneticCode[4]
	var tabbyGene = geneticCode[5]
	var tabbyPattern = geneticCode[6]
	var whiteness = geneticCode[9]
	var leatherGene = geneticCode[10]
	var eyePigment = geneticCode[11]
	var eyeRefraction = geneticCode[12]

	# set base coat
	var baseTex = getBaseTexture(eumelanin, red, dilution, tabbyGene, tabbyPattern)
	if baseTex == null:
		print("Error: base texture is null!")
	else:
		print("Loading base texture: %s" % baseTex.resource_path)
	base.texture = baseTex

	# set pattern layer
	pattern.texture = getPatternTexture(tabbyGene, tabbyPattern)

	# set white layer
	white.texture = getWhiteTexture(whiteness)

	# lineart always on top
	lineart.texture = load("res://assets/art/cat/lineart/short.png")
	
	# set leather layer
	print()
	leather.texture = getLeatherColour(leatherGene)
	print("Leather gene: ", leatherGene + ". Displaying ", leather.texture)
	
	eyes.texture = getEyeColour(eyePigment, eyeRefraction)


func getBaseTexture(eumelanin, red, dilution, tabbyGene, tabbyPattern):
	var base_name = "short_"

	# determine base colour root
	var colour = ""
	match eumelanin:
		"0", "1", "2":
			colour = "blue" if dilution == "2" else "black"
		"3", "4":
			colour = "lilac" if dilution == "2" else "chocolate"
		"5":
			colour = "fawn" if dilution == "2" else "cinnamon"
		_:
			colour = "black"  # fallback

	# Red override
	if red == "1":  # Red gene present
		colour = "cream" if dilution == "2" else "ginger"
	elif red == "2":  # Tortie/Torbie
		if tabbyGene == "2":
			colour += "_torbie"
		else:
			colour += "_tortie"
	
	var tex_path = "res://assets/art/cat/base/%s%s.png" % [base_name, colour]
	print("Loading base texture: ", tex_path)

	return load("res://assets/art/cat/base/%s%s.png" % [base_name, colour])

func getPatternTexture(tabbyGene, tabbyPattern):
	if tabbyGene == "0":
		return null

	match tabbyPattern:
		"2": return load("res://assets/art/cat/pattern/short_mackerel.png")
		"1": return load("res://assets/art/cat/pattern/short_mackerel.png")
		_:
			return load("res://assets/art/cat/pattern/short_mackerel.png")

func getWhiteTexture(whiteness):
	print("Whiteness value received: ", whiteness, " (type: ", typeof(whiteness), ")")
	match whiteness:
		"0": return null
		"1": return load("res://assets/art/cat/white/short_1.png")
		"2": return load("res://assets/art/cat/white/short_2.png")
		"3": return load("res://assets/art/cat/white/short_3.png")
		"4": return load("res://assets/art/cat/white/short_4.png")
		"5": return load("res://assets/art/cat/white/short_5.png")
		"6": return load("res://assets/art/cat/white/short_6_7_8_9.png")
		"7": return load("res://assets/art/cat/white/short_6_7_8_9.png")
		"8": return load("res://assets/art/cat/white/short_6_7_8_9.png")
		"9": return load("res://assets/art/cat/white/short_6_7_8_9.png")
		_:
			return null

func getEyeColour(eyePigment, eyeRefraction):
	var eyePath = "res://assets/art/cat/eyecolour/%s%s.png" % [eyePigment, eyeRefraction]
	return load(eyePath) as Texture

func getLeatherColour(leatherCode: String) -> Texture:
	var leatherColour = int(leatherCode)
	print("-----------------", leatherCode)
	var texturePath = "res://assets/art/cat/leather/%s.png" % Enums.LeatherColour.keys()[leatherColour].to_lower()
	return load(texturePath)
