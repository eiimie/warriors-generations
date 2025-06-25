extends Control

func _on_StartGame_StartButton_up():
	get_tree().change_scene_to_file("res://scenes/startingNewGame_NewLeader.tscn")

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
	
