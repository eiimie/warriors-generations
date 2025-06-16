# handles appearance descriptors based on genetic code 

class_name Appearance

static var rng = RandomNumberGenerator.new()

# a method to return an Allegiances-style description of a cat based on its genetic code 
# returns catDescription
static func describeThisCat(genCode: String) -> String:
	# credit to https://perchance.org/warriorcats-allegiances-generator for giving me inspiration
	# and of course the books themselves
	# NO REFERENCE TO PERSONALITIES OR SPECIAL TRAITS (e.g. long whiskers or long tail) - future feature?
	
	
	# DEBUG - naming a Grey molly as "a ginger molly"
	
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
		if whiteness == "8" or whiteness == "9":
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
							"5":
								# cinnamon
								catDescription += "reddish brown "
							"3", "4": 
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
						match eumelanin:
							"0", "1", "2":
								catDescription += "grey-cream " if dilution == "2" else "black-red "
							"3":
								catDescription += "lilac-cream " if dilution == "2" else "brown-red "
							"5":
								catDescription += "fawn-cream " if dilution == "2" else "cinnamon-red "
							_:
								catDescription += "tortie "  # fallback


						# additional label based on whiteness / tabby
						if whiteness in ["3", "4", "5", "6"]:
							catDescription += "calico "
						elif tabby == "2":
							catDescription += "torbie "
						else:
							catDescription += "tortoiseshell "


			else:
				# cat is DILUTE
				
				#extract 3rd char to determine if RED or TORT/BIE
				match red:
					"0":
						# not red
						match eumelanin: 
							"5":
								# cinnamon
								catDescription += "fawn "
							"3", "4": 
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
	# validate
	var expected_length = 10  
	if genCode.length() < expected_length:
		return "ERROR: Genetic code too short."
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

# a method to analyse genetic code
# and return phenotype & genotype
static func identifyGeneticCode(argument: String) -> String:
	var description = ""
	
	# Validate argument length and ensure all characters are digits
	if argument.length() != 10:
		return "[ERROR: Invalid genetic code given to describeGeneticCode.]"

	# Sex
	match argument[0]:
		"0":
			description += "Male, "
		"1":
			description += "Female, "
		_:
			return "[ERROR: Invalid sex icon given to describeGeneticCode.]"

	# Fur length
	match argument[1]:
		"0":
			description += "Short fur, "
		"1":
			description += "Short fur carrying long, "
		"2":
			description += "Long fur, "
		_:
			return "[ERROR: Invalid fur length icon given to describeGeneticCode.]"

	# Eumelanin
	match argument[2]:
		"0":
			description += "Black eumelanin, "
		"1":
			description += "Black carrying chocolate eumelanin, "
		"2":
			description += "Black carrying cinnamon eumelanin, "
		"3":
			description += "Chocolate eumelanin, "
		"4":
			description += "Chocolate carrying cinnamon eumelanin, "
		"5":
			description += "Cinnamon eumelanin, "
		_:
			return "[ERROR: Invalid eumelanin icon given to describeGeneticCode.]"

	# Red
	match argument[3]:
		"0":
			description += "Not red, "
		"1":
			description += "Red, "
		"2":
			description += "Tortie, "
		_:
			return "[ERROR: Invalid red icon given to describeGeneticCode.]"

	# Dilute
	match argument[4]:
		"0":
			description += "Non-dilute, "
		"1":
			description += "Non-dilute carrying dilute, "
		"2":
			description += "Dilute, "
		_:
			return "[ERROR: Invalid dilute icon given to describeGeneticCode.]"

	# Tabby
	match argument[5]:
		"0":
			description += "Solid, "
		"1":
			description += "Solid carrying tabby, "
		"2":
			description += "Tabby, "
		_:
			return "[ERROR: Invalid tabby icon given to describeGeneticCode.]"

	# Tabby pattern
	match argument[6]:
		"0":
			description += "Mackerel tabby pattern, "
		"1":
			description += "Classic tabby pattern, "
		_:
			return "[ERROR: Invalid tabby pattern icon given to describeGeneticCode.]"

	# Silver (commented out in C# code)
	match argument[7]:
		"0":
			pass  # description += "Silver, "
		"1":
			pass  # description += "Silver carrying non-silver, "
		"2":
			pass  # description += "Non-silver, "
		_:
			return "[ERROR: Invalid silver icon given to describeGeneticCode.]"

	# Colourpoint (commented out in C# code)
	match argument[8]:
		"0":
			pass  # description += "Not pointed, "
		"1":
			pass  # description += "Carrying point, "
		"2":
			pass  # description += "Pointed, "
		_:
			return "[ERROR: Invalid colourpoint icon given to describeGeneticCode.]"

	# Whiteness
	description += "Whiteness level: " + argument[9]
		
	return description 
