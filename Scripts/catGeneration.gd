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

# generate offspring from two given genetic codes
# returns offspringGeneticCode 
static func generateOffspring() -> String:
	var offspringGeneticCode
	return offspringGeneticCode

# a method to return an Allegiances-style description of a cat based on its genetic code 
# returns catDescription
static func describeThisCat(genCode: String) -> String:
	# credit to https://perchance.org/warriorcats-allegiances-generator for giving me inspiration
	# and of course the books themselves
	# NO REFERENCE TO PERSONALITIES OR SPECIAL TRAITS (e.g. long whiskers or long tail) - future feature?
	var catDescription
	
	# first validate the argument
	if genCode.length() != 10 and !genCode.is_valid_int():
		# length is NOT 10 (invalid length) and IS NOT VALID INT (invalid)
		return("INVALID GENETIC CODE.")
	else:
		# valid genetic code 
		
		catDescription = "a "
		
		# now, first, extract 4th character to determine if dilute or not 
		var dilution = genCode[4]
		var red = genCode[3]
		var eumelanin = genCode[2]
		var tabby = genCode[5]
		var whiteness = genCode[9]
		var sex = genCode[0]
		var thisCatIsWhite = false
		
		# does cat have SUBSTANTIAL WHITE (whiteness = 7 8 or 9)
		if whiteness == "7" or whiteness == "8" or whiteness == "9":
			# it does! it should be described as white! 
			thisCatIsWhite = true
			catDescription += "white "
		else:
			# it doesn't! describe it normally
			if dilution != "2":
				# cat is NON DILUTE
				
				match red:
					"0":
						# not red
						match eumelanin: 
							"5","3":
								# cinnamon
								catDescription += "light brown "
							"4": 
								# chocolate
								catDescription += "brown "
							"0","1","2":
								catDescription += "black "
						catDescription += ""
					"1":
						# red! considered a ginger tabby 
						catDescription += "ginger "
					"2":
						# tortie! 
						# if more than 5 white, considered a calico
						# if less than 5 and a tabby, considered a torbie.
						if whiteness == "5" or whiteness == "6" or whiteness == "4" or whiteness == "3":
							catDescription += "calico "
						elif tabby == "2":
							catDescription += "torbie "
			else:
				# cat is DILUTE
				
				#extract 3rd char to determine if RED or TORT/BIE
				match red:
					"0":
						# not red
						match eumelanin: 
							"5","3":
								# cinnamon
								catDescription += "fawn "
							"4": 
								# chocolate
								catDescription += "lilac "
							"0","1","2":
								catDescription += "grey "
						if tabby == "2":
							# is tabby cat
							catDescription += "tabby "
						catDescription += ""
					"1":
						# red! considered a ginger tabby 
						catDescription += "cream "
					"2":
						# tortie! 
						# if more than 5 white, considered a calico
						# if less than 5 and a tabby, considered a torbie.
						catDescription += "grey-and-cream "
						if whiteness == "5" or "6" or "4":
							catDescription += "calico "
						elif tabby == "2":
							catDescription += "torbie "
		
		if tabby == "2" and red != "2" and !thisCatIsWhite:
			# is tabby cat
			catDescription += "tabby "
		# now extract sex 
		
		if sex == "0":
			# dude cat 
			catDescription += "tom "
		else:
			# lady cat
			catDescription += "molly " # in this house we use molly and NOT she-cat
		
		return catDescription
	return catDescription

# a method to return variable of coat colour/tabby/tortie or calico status from a given genetic code
# returns catAppearanceDescription
static func describeThisCatsAppearance(genCode: String) -> String:
	# appearances: white, bi, tri, brown, black, red, golden, pattern
	
	# Initialize the appearance description variable
	var catAppearanceDescription
	
	# Extract relevant parts from the genetic code
	var dilution = genCode[4]
	var red = genCode[3]
	var eumelanin = genCode[2]
	var tabby = genCode[5]
	var whiteness = genCode[9]
	
	# Check if the cat is white
	if whiteness == "7" or whiteness == "8" or whiteness == "9":
		# The cat is white, return "white"
		catAppearanceDescription = "white"
	else:
		# Check for tortie or torbie status
		if red == "2":
			# If the cat is tortie or torbie (tortoiseshell or tabby tortie)
			if tabby == "2":
				catAppearanceDescription = "bi"  # Torbie (tortoiseshell tabby)
			else:
				catAppearanceDescription = "bi"  # Tortoiseshell (tortie)
		elif whiteness == "5" or whiteness == "6" or whiteness == "4" or whiteness == "3":
			# If the cat is a calico
			catAppearanceDescription = "tri"  # Calico
		else:
			# Check for non-white cats (black, blue, brown, red, or golden)
			match red:
				"0":
					# Not red (black, blue, brown)
					match eumelanin:
						"5", "3":
							# Cinnamon (light brown)
							if tabby == "2":
								catAppearanceDescription = "pattern"  # Tabby pattern
							else:
								catAppearanceDescription = "brown"  # Brown (light brown/cinnamon)
						"4":
							# Chocolate (dark brown)
							catAppearanceDescription = "brown"  # Dark brown/chocolate
						"0", "1", "2":
							# Black
							if tabby == "2":
								catAppearanceDescription = "pattern"  # Tabby pattern
							else:
								catAppearanceDescription = "black"  # Black
				"1":
					# Red (ginger)
					catAppearanceDescription = "red"  # Red (ginger)
				"2":
					# Golden (cream)
					catAppearanceDescription = "golden"  # Golden (cream)
		
		# If the cat is a tabby and not white, give 50/50 chance between pattern or coat color
		if tabby == "2" and whiteness != "7" and whiteness != "8" and whiteness != "9":
			if randi() % 2 == 0:
				catAppearanceDescription = "pattern"  # Tabby pattern
			else:
				# Pick the appropriate color (black, blue, brown, red, golden)
				match red:
					"0":
						# Not red (black, blue, brown)
						match eumelanin:
							"5", "3":
								catAppearanceDescription = "brown"  # Cinnamon
							"4":
								catAppearanceDescription = "brown"  # Chocolate
							"0", "1", "2":
								catAppearanceDescription = "black"  # Black
					"1":
						catAppearanceDescription = "red"  # Red (ginger)
					"2":
						catAppearanceDescription = "golden"  # Golden (cream)
	
	return catAppearanceDescription


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
