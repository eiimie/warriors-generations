extends Node

# this class is to generate cats, generate offspring, 
# generate Allegiances descriptions, and identify the appearance of a cat 
class_name catGeneration 

static var rng = RandomNumberGenerator.new()

# ************ FUNCTIONS AND STATUS
# ranGenCat_NotWeighted - not implemented, base code done, working as intended
# generateOffspring - not implemented, untested
# describeThisCat - not implemented, base code done, tested
# describeThisCatsAppearance - not implemented, untested


# static function to generate a new random cat without weight genes
# returns newCatGeneticCode
static func ranGenCat_NotWeighted() -> String: 
	var newCatGeneticCode = ""
	
	# sex: 0 = male, 1 = female 
	var sex = rng.randi_range(0,1)
	newCatGeneticCode += str(sex)
	
	# fur length: 0 = short, 1 = short carrying long, 2 = long
	var furLen = rng.randi_range(0,2)
	newCatGeneticCode += str(furLen)
	
	# eumelanin. is cat black, chocolate, or cinnamon?
	# 0 = black phenotype. 1 = black phenotype, chocolate carrier. 2 = black phenotype, cinnamon carrier
	# 3 = chocolate phenotype. 4 = chocolate phenotype, cinnamon carrier
	# 5 = cinnamon
	var eumel = rng.randi_range(0,5)
	newCatGeneticCode += str(eumel)
	
	# red. is a cat red or not red? if FEMALE cat, is she tortoiseshell? 
	# 0 = not red. 1 = red. 2 = tortoiseshell/tortie
	
	var furRed
	
	if sex == 1:
		# cat is female. can be RED, NOT RED, or TORTIE
		furRed = rng.randi_range(0,2) 
		newCatGeneticCode += str(furRed)
	else:
		# cat is male. can only be RED or NOT RED
		furRed = rng.randi_range(0,1)
		newCatGeneticCode += str(furRed)
	
	# now dilution. is cat NON DILUTE, DILUTE CARRIER, or DILUTE?
	# 0 = non dilute. 1 = non dilute, dilute carrier. 2 = dilute.
	var dilution = rng.randi_range(0,2)
	newCatGeneticCode += str(dilution)
	
	# tabby gene. 0 = solid (not a tabby). 1 = tabby carrier (solid phenotype). 2 = tabby 
	var tabbiness
	if furRed == 1:
		# cat is red. red cats always tabbies.
		tabbiness = 2
	else: 
		# cat is not red. could not be tabby. 
		tabbiness = rng.randi_range(0,2)
	newCatGeneticCode += str(tabbiness)
	
	# tabby pattern. what type of stripes does the cat have?! 
	# 0 = mackerel. 1 = classic
	# extras (to add in later maybe?) incl: spotted, ticked. mayhaps more
	
	var tabPat = rng.randi_range(0,1)
	newCatGeneticCode += str(tabPat)
	
	var silverness = 2 
	newCatGeneticCode += str(silverness)
	
	var isPoint = 0
	newCatGeneticCode += str(isPoint)
	
	# ******************************************************************************************
	# later genes to add in later on:  
	# silver (0 = silver. 1 = silver carry non silver. 2 = non silver.
	# colour point (0 = not point. 1 = not point, carry point. 2 = point.
	# ******************************************************************************************
	
	# white gene! 
	# determines level of whiteness in a cat
	# int from 0 to 9 where 0 = no white at all, and 9 = completely white! 
	
	var white = rng.randi_range(0,9)
	newCatGeneticCode += str(white)
	
	return newCatGeneticCode

static func ranGenCat_Weighted(weighting: String) -> String: 
	var newCatGeneticCode = ""
	rng.randomize()
	
	# sex: 0 = male, 1 = female 
	var sex
	if weighting == "male": 
		sex = "0"
	elif weighting == "female":
		sex = "1"
	else:
		sex = rng.randi_range(0,1)
	
	newCatGeneticCode += str(sex)
	
	# fur length: 0 = short, 1 = short carrying long, 2 = long
	var furLen = rng.randi_range(0,2)
	newCatGeneticCode += str(furLen)
	
	# eumelanin. is cat black, chocolate, or cinnamon?
	# 0 = black phenotype. 1 = black phenotype, chocolate carrier. 2 = black phenotype, cinnamon carrier
	# 3 = chocolate phenotype. 4 = chocolate phenotype, cinnamon carrier
	# 5 = cinnamon
	var eumel = rng.randi_range(0,5)
	newCatGeneticCode += str(eumel)
	
	# red. is a cat red or not red? if FEMALE cat, is she tortoiseshell? 
	# 0 = not red. 1 = red. 2 = tortoiseshell/tortie
	
	var furRed
	
	if sex == "1":
		# cat is female. can be RED, NOT RED, or TORTIE
		furRed = rng.randi_range(0,2) 
		newCatGeneticCode += str(furRed)
	else:
		# cat is male. can only be RED or NOT RED
		furRed = rng.randi_range(0,1)
		newCatGeneticCode += str(furRed)
	
	# now dilution. is cat NON DILUTE, DILUTE CARRIER, or DILUTE?
	# 0 = non dilute. 1 = non dilute, dilute carrier. 2 = dilute.
	var dilution = rng.randi_range(0,2)
	newCatGeneticCode += str(dilution)
	
	# tabby gene. 0 = solid (not a tabby). 1 = tabby carrier (solid phenotype). 2 = tabby 
	var tabbiness
	if furRed == 1:
		# cat is red. red cats always tabbies.
		tabbiness = 2
	else: 
		# cat is not red. could not be tabby. 
		tabbiness = rng.randi_range(0,2)
	newCatGeneticCode += str(tabbiness)
	
	# tabby pattern. what type of stripes does the cat have?! 
	# 0 = mackerel. 1 = classic
	# extras (to add in later maybe?) incl: spotted, ticked. mayhaps more
	
	var tabPat = rng.randi_range(0,1)
	newCatGeneticCode += str(tabPat)
	
	var silverness = 2 
	newCatGeneticCode += str(silverness)
	
	var isPoint = 0
	newCatGeneticCode += str(isPoint)
	
	# ******************************************************************************************
	# later genes to add in later on:  
	# silver (0 = silver. 1 = silver carry non silver. 2 = non silver.
	# colour point (0 = not point. 1 = not point, carry point. 2 = point.
	# ******************************************************************************************
	
	# white gene! 
	# determines level of whiteness in a cat
	# int from 0 to 9 where 0 = no white at all, and 9 = completely white! 
	
	var white = rng.randi_range(0,9)
	newCatGeneticCode += str(white)
	
	return newCatGeneticCode


# Hhlper function for 50/50 inheritance
static func inherit_50_50(rng: RandomNumberGenerator, option1, option2) -> String:
	return option1 if rng.randi_range(0, 1) == 0 else option2

# generate offspring from two given genetic codes
# returns offspringGeneticCode 
static func generate_offspring(gen_code_father: String, gen_code_mother: String) -> String:
	# Validate genetic codes
	var expected_length = 10  # Change this if your genetic code length changes
	if gen_code_father.length() < expected_length or gen_code_mother.length() < expected_length:
		return "ERROR: Genetic codes are too short."

	var offspring_genetic_code = ""
	var rng = RandomNumberGenerator.new()
	rng.randomize()

	# Determine sex (0 = male, 1 = female)
	var sex = rng.randi_range(0, 1)  # 0 = male, 1 = female
	offspring_genetic_code += str(sex)
	print("Sex is: ", sex)

	# ----- Fur length inheritance -----
	var father_fur_len = gen_code_father[1]
	var mother_fur_len = gen_code_mother[1]
	var fur_len = ""
	match father_fur_len:
		"0":
			match mother_fur_len:
				"0": fur_len = "0"
				"1": fur_len = inherit_50_50(rng, "0", "1")
				"2": fur_len = "1"
		"1":
			match mother_fur_len:
				"0": fur_len = inherit_50_50(rng, "0", "1")
				"1": fur_len = inherit_50_50(rng, "1", "1")
				"2": fur_len = "1"
		"2":
			match mother_fur_len:
				"0": fur_len = "1"
				"1": fur_len = inherit_50_50(rng, "1", "2")
				"2": fur_len = "2"
	offspring_genetic_code += fur_len
	print("Fur length is: ", fur_len)

	# ----- Eumelanin inheritance -----
	var father_eumel = gen_code_father[2]
	var mother_eumel = gen_code_mother[2]
	var eumel = ""  # Ensure the variable is initialized
	match father_eumel:
		"0":
			match mother_eumel:
				"0": eumel = "0"
				"1", "2": eumel = inherit_50_50(rng, "0", "1")
				"3": eumel = "1"
				"4": eumel = inherit_50_50(rng, "1", "2")
				"5": eumel = "2"
		"1":
			match mother_eumel:
				"0": eumel = inherit_50_50(rng, "0", "1")
				"1": eumel = ["1", "1", "0", "3"][rng.randi_range(0, 3)]
				"2": eumel = ["0", "1", "2", "4"][rng.randi_range(0, 3)]
				"3": eumel = inherit_50_50(rng, "1", "3")
				"4": eumel = ["1", "2", "3", "4"][rng.randi_range(0, 3)]
				"5": eumel = inherit_50_50(rng, "2", "4")
		"2":
			match mother_eumel:
				"0": eumel = inherit_50_50(rng, "0", "2")
				"1": eumel = ["0", "1", "2", "4"][rng.randi_range(0, 3)]
				"2": eumel = ["2", "2", "0", "5"][rng.randi_range(0, 3)]
				"3": eumel = inherit_50_50(rng, "1", "4")
				"4": eumel = ["1", "2", "4", "5"][rng.randi_range(0, 3)]
				"5": eumel = inherit_50_50(rng, "2", "5")
		"3":
			match mother_eumel:
				"0": eumel = "2"
				"1": eumel = inherit_50_50(rng, "2", "3")
				"2": eumel = inherit_50_50(rng, "1", "4")
				"3": eumel = "3"
				"4": eumel = inherit_50_50(rng, "3", "4")
				"5": eumel = "4"
		"4":
			match mother_eumel:
				"0": eumel = inherit_50_50(rng, "1", "4")
				"1": eumel = ["1", "2", "3", "4"][rng.randi_range(0, 3)]
				"2": eumel = ["1", "2", "4", "5"][rng.randi_range(0, 3)]
				"3": eumel = inherit_50_50(rng, "3", "4")
				"4": eumel = ["2", "3", "4", "5"][rng.randi_range(0, 3)]
				"5": eumel = inherit_50_50(rng, "4", "5")
		"5":
			match mother_eumel:
				"0": eumel = "2"
				"1": eumel = inherit_50_50(rng, "2", "4")
				"2": eumel = inherit_50_50(rng, "2", "5")
				"3": eumel = "4"
				"4": eumel = inherit_50_50(rng, "4", "5")
				"5": eumel = "5"
	offspring_genetic_code += eumel
	print("Eumelanin is: ", eumel)


	# ----- Red inheritance -----
	var father_red = gen_code_father[3]
	var mother_red = gen_code_mother[3]
	var red
	match father_red:
		"0":
			match mother_red:
				"0": red = "0"
				"1": red = "1" if sex == 0 else "2"
				"2": red = inherit_50_50(rng, "0", "1") if sex == 0 else inherit_50_50(rng, "0", "2")
		"1":
			match mother_red:
				"0": red = "0" if sex == 0 else "2"
				"1": red = "1"
				"2": red = inherit_50_50(rng, "0", "1") if sex == 0 else inherit_50_50(rng, "1", "2")
	offspring_genetic_code += red
	print("Red is ", red)

	# ----- Dilute inheritance -----
	var father_dilute = gen_code_father[4]
	var mother_dilute = gen_code_mother[4]
	var dilute = ""
	match father_dilute:
		"0":
			match mother_dilute:
				"0": dilute = "0"
				"1": dilute = inherit_50_50(rng, "0", "1")
				"2": dilute = "1"
		"1":
			match mother_dilute:
				"0": dilute = inherit_50_50(rng, "0", "1")
				"1": dilute = ["1", "1", "0", "2"][rng.randi_range(0, 3)]
				"2": dilute = inherit_50_50(rng, "1", "2")
		"2":
			match mother_dilute:
				"0": dilute = "1"
				"1": dilute = inherit_50_50(rng, "1", "2")
				"2": dilute = "2"
	offspring_genetic_code += dilute
	print("Dilute is ", dilute)

	# ----- Tabby inheritance -----
	var father_tabby = gen_code_father[5]
	var mother_tabby = gen_code_mother[5]
	var tabby = ""
	match father_tabby:
		"0":
			match mother_tabby:
				"0": tabby = "0"
				"1": tabby = inherit_50_50(rng, "0", "1")
				"2": tabby = "1"
		"1":
			match mother_tabby:
				"0": tabby = inherit_50_50(rng, "0", "1")
				"1": tabby = ["1", "1", "0", "2"][rng.randi_range(0, 3)]
				"2": tabby = inherit_50_50(rng, "1", "2")
		"2":
			match mother_tabby:
				"0": tabby = "1"
				"1": tabby = inherit_50_50(rng, "1", "2")
				"2": tabby = "2"
	offspring_genetic_code += tabby
	print("Tabby is ", tabby)

	# ----- Tabby pattern inheritance -----
	var father_tab_pat = gen_code_father[6]
	var mother_tab_pat = gen_code_mother[6]
	var tab_pat = ""
	match father_tab_pat:
		"0":
			match mother_tab_pat:
				"0": tab_pat = "0"
				"1": tab_pat = inherit_50_50(rng, "0", "1")
		"1":
			match mother_tab_pat:
				"0": tab_pat = inherit_50_50(rng, "0", "1")
				"1": tab_pat = "1"
	offspring_genetic_code += tab_pat
	print("Tabby pattern is ", tab_pat)

	# ----- Silver inheritance -----
	var father_silver = gen_code_father[7]
	var mother_silver = gen_code_mother[7]
	var silver = ""
	match father_silver:
		"0":
			match mother_silver:
				"0": silver = "0"
				"1": silver = inherit_50_50(rng, "0", "1")
				"2": silver = "1"
		"1":
			match mother_silver:
				"0": silver = inherit_50_50(rng, "0", "1")
				"1": silver = ["1", "1", "0", "2"][rng.randi_range(0, 3)]
				"2": silver = inherit_50_50(rng, "1", "2")
		"2":
			match mother_silver:
				"0": silver = "1"
				"1": silver = inherit_50_50(rng, "1", "2")
				"2": silver = "2"
	offspring_genetic_code += silver
	print("Silver is ", silver)
	
	# ----- silver ----- 
	offspring_genetic_code += "0"

	# ----- White inheritance -----
	var father_white = int(gen_code_father[9])
	var mother_white = int(gen_code_mother[9])
	var white = ""
	if father_white == 0 or mother_white == 0:
		white = str(rng.randi_range(0, 1))
	else:
		white = str(rng.randi_range(min(father_white, mother_white), max(father_white, mother_white)))
	offspring_genetic_code += white
	print("White is ", white)

	return offspring_genetic_code


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
