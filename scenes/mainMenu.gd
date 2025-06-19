extends Control

func _on_StartGame_StartButton_up():
	get_tree().change_scene_to_file("res://scenes/startingNewGame_NewLeader.tscn")
	
	# Create a playerClan instance
	var clan = playerClan.new()

	# Add test cats to the clan
	for i in range(3):
		var id = i
		var name = "TestCat_%d" % i
		var sex = randi() % 2
		var age = randi() % 10 + 1
		var rank = i + 1  # Avoid leader (0) for now
		var gen_code = Genetics.ranGenCat_NotWeighted()
		var prefix = "Prefix%d" % i
		var suffix = "Suffix%d" % i
		var isPregnant = false
		var pregProgress = 0
		
		var cat = clan.addNewCatToClan(id, name, sex, age, rank, gen_code, prefix, suffix, isPregnant, pregProgress)
		print("Added Cat: ", cat.name, " | GenCode: ", cat.genetic_code)

	# Get a cat by ID
	var cat1 = clan.getCat(1)
	if cat1:
		print("Retrieved Cat 1: ", cat1.name, " | GenCode: ", cat1.genetic_code)
	else:
		print("Cat 1 not found!")

	# List all cats
	print("--- All Cats in Clan ---")
	for cat in clan.getAllCats():
		print("Cat: ", cat.name, " | ID: ", cat.id)

	# Mark one cat as dead (by setting rank to -1)
	var dead_cat = clan.getCat(2)
	if dead_cat:
		dead_cat.rank = -1
		print("Marked Cat %s as dead" % dead_cat.name)

	# List living cats
	print("--- Living Cats ---")
	for cat in clan.getLivingCats():
		print("Living Cat: ", cat.name, " | ID: ", cat.id)

	# List dead cats
	print("--- Dead Cats ---")
	for cat in clan.getDeadCats():
		print("Dead Cat: ", cat.name, " | ID: ", cat.id)

	# Remove a cat
	clan.removeCatFromClan(0)
	print("Removed Cat with ID 0")

	# Final list
	print("--- Final Cat List ---")
	for cat in clan.getAllCats():
		print("Remaining Cat: ", cat.name, " | ID: ", cat.id)

func GENERATEOFFSPRINGDEBUGTEST() -> void:
	# delete later
	var father_code = $TextEditFather.text.strip_edges()
	var mother_code = $TextEditMother.text.strip_edges()
	
	if father_code == "" or mother_code == "":
		$TextEditOffSpring.text = "Please enter both genetic codes"
		return
		
	var offspring_code = Genetics.generate_offspring(father_code, mother_code)
	
	$TextEditOffspring.text = offspring_code 
	


func _on_generatenewcat_pressed_DELETELATERDEBUG() -> void:
	$generatenewcat/newcatcodegohere.text = Genetics.ranGenCat_NotWeighted()
	$TextEditNewDescription.text = Appearance.describeThisCat($generatenewcat/newcatcodegohere.text)
	
