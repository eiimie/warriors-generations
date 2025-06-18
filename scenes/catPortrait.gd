extends Node2D

@onready var lineart = $lineart
@onready var base = $baseColour
@onready var tabby = $tabby
@onready var white = $white
@onready var tortie = $tortie

func resetPortrait():
	for child in get_children():
		if child is Sprite2D:
			child.texture = null

func displayCat(geneticCode: String):
	if geneticCode.length() != 10:
		print("Invalid genetic code passed to catPortrait.displayCat")
		return
	
	# first, clear all current variables:
	# note - optimise this code at some point
	lineart.texture = null 
	base.texture = null
	tabby.texture = null
	white.texture = null
	tortie.texture = null
	
	var eumelanin = geneticCode[2]
	var red = geneticCode[3]
	var dilution = geneticCode[4]
	var tabbyGene = geneticCode[5]
	var tabbyPattern = geneticCode[6]
	var whiteness = geneticCode[9]
	
	# load lineart
	lineart.texture = load("res://assets/cats/portrait_temp/lineart.png")
	
	# determine base coat colour
	base.texture = getBaseTexture(eumelanin, red, dilution)
	
	# add tabby layer if needed
	tabby.texture = getTabbyTexture(tabbyGene, tabbyPattern)
	
	# add white layer if needed
	white.texture = getWhiteTexture(whiteness)
	
func getBaseTexture(eumelanin, red, dilution):
	if red == "1":
		if dilution == "2":
			return load("res://assets/cats/portrait_temp/basecolour_cream.png")
		else:
			return load("res://assets/cats/portrait_temp/basecolour_ginger.png")
	elif red == "2":
		if dilution == "2":
			# dilute
			tortie.texture = load("res://assets/cats/portrait_temp/tortie_cream.png")
		else:
			# not dilute
			tortie.texture = load("res://assets/cats/portrait_temp/tortie_red.png")
		match eumelanin:
			"0", "1", "2": return load("res://assets/cats/portrait_temp/basecolour_blue.png") if dilution == "2" else load("res://assets/cats/portrait_temp/basecolour_black.png")
			"3", "4": return load("res://assets/cats/portrait_temp/basecolour_lilac.png") if dilution == "2" else load("res://assets/cats/portrait_temp/basecolour_chocolate.png")
			"5": return load("res://assets/cats/portrait_temp/basecolour_fawn.png") if dilution == "2" else load("res://assets/cats/portrait_temp/basecolour_cinnamon.png")
	else:
		match eumelanin:
			"0", "1", "2": return load("res://assets/cats/portrait_temp/basecolour_blue.png") if dilution == "2" else load("res://assets/cats/portrait_temp/basecolour_black.png")
			"3", "4": return load("res://assets/cats/portrait_temp/basecolour_lilac.png") if dilution == "2" else load("res://assets/cats/portrait_temp/basecolour_chocolate.png")
			"5": return load("res://assets/cats/portrait_temp/basecolour_fawn.png") if dilution == "2" else load("res://assets/cats/portrait_temp/basecolour_cinnamon.png")
	return null 

func getTabbyTexture(tabbyGene, tabbyPattern):
	if tabbyGene != "2":
		return null #not a tabby :( 
	return load("res://assets/cats/portrait_temp/tabby_classic.png") if tabbyPattern == "2" else load ("res://assets/cats/portrait_temp/tabby_mackerel.png")

func getWhiteTexture(whiteness):
	match whiteness:
		"0": return null
		"1": return load("res://assets/cats/portrait_temp/whiteness_1.png")
		"2": return load("res://assets/cats/portrait_temp/whiteness_2.png")
		"3": return load("res://assets/cats/portrait_temp/whiteness_3.png")
		"4": return load("res://assets/cats/portrait_temp/whiteness_4.png")
		"5": return load("res://assets/cats/portrait_temp/whiteness_5.png")
		"6": return load("res://assets/cats/portrait_temp/whiteness_6.png")
		"7": return load("res://assets/cats/portrait_temp/whiteness_7.png")
		"8": return load("res://assets/cats/portrait_temp/whiteness_8.png")
		"9": return load("res://assets/cats/portrait_temp/whiteness_9.png")
