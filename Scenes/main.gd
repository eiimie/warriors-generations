extends Node2D

var catGen = preload("res://Scripts/Cat/catGeneration.gd").new() 
var nameManager = preload("res://Scripts/Cat/catNameGenerator.gd").new()
var appearanceManager = preload("res://Scripts/Cat/appearanceManager.gd").new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("start!")
	var dadGeneticCode = catGen.ranGenCat_Weighted("male")
	var dadAppearanceDescription = appearanceManager.identifyGeneticCode(dadGeneticCode)
	var mumGeneticCode = catGen.ranGenCat_Weighted("female")
	var mumAppearanceDescription = appearanceManager.identifyGeneticCode(mumGeneticCode)

	var kidGeneticCode = catGen.generate_offspring(dadGeneticCode,mumGeneticCode)
	var kidAppearanceDescription = appearanceManager.identifyGeneticCode(kidGeneticCode)
	
	print("Dad: ", dadGeneticCode, ": ", dadAppearanceDescription, "
	Mother: ", mumGeneticCode, ": ", mumAppearanceDescription, "
	Offspring: ", kidGeneticCode, ": ", kidAppearanceDescription)

	# testing cat generation code
	
	#GENERATE 10 RANDOM CATS
	#for i in range(10):
		## generate a new genetic code
		#var newGeneticCode = catGen.ranGenCat_NotWeighted()
		
		## describe this cat's appearance once and reuse the result
		#var appearanceDescription = catGen.describeThisCatsAppearance(newGeneticCode)
		
		## print results to the console
		#print("Generated Cat:")
		#print(" - Warrior Name: ", nameManager.generateWarriorName(appearanceDescription))
		#print(" - Genetic Code: ", newGeneticCode)
		#print(" - Full Description: ", catGen.describeThisCat(newGeneticCode))
		#print(" - Appearance: ", appearanceDescription)
		
		
