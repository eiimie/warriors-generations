extends Node2D

var catGen = preload("res://Scripts/catGeneration.gd").new() 
var nameManager = preload("res://Scripts/catNameGenerator.gd").new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# testing cat generation code
	for i in range(10):
		# generate a new genetic code
		var newGeneticCode = catGen.ranGenCat_NotWeighted()
		
		# describe this cat's appearance once and reuse the result
		var appearanceDescription = catGen.describeThisCatsAppearance(newGeneticCode)
		
		# print results to the console
		print("Generated Cat:")
		print(" - Warrior Name: ", nameManager.generateWarriorName(appearanceDescription))
		print(" - Genetic Code: ", newGeneticCode)
		print(" - Full Description: ", catGen.describeThisCat(newGeneticCode))
		print(" - Appearance: ", appearanceDescription)
