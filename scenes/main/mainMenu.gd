extends Control

func _ready():
	# play back ground music
	var bgm = AudioManager.get_node("bgm_mainMenu")
	if not bgm.playing:
		bgm.play()
	
	var animatedLogo= $gameLogoAnimated
	
	# play animated logo animation
	animatedLogo.play("logo")
	
	# animate the main menu sliding in from the left
	var menu = $Menu
	var tween = create_tween()
	
	# start off-screen to the left
	menu.position.x = -menu.size.x
	
	# slide it to the desired position 
	tween.tween_property(
		menu,
		"position:x",
		20,
		1.0
	).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT).set_delay(1)
	
	# while sliding logo upwards
	tween.parallel().tween_property(
		animatedLogo,
		"position:y",
		-200,
		1.5
	).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT).set_delay(1)

func _on_StartGame_StartButton_up():
	AudioManager.get_node("buttonClick").play() # play button click noise
	AudioManager.get_node("pageTurn").play() #play page turn noise
	get_tree().change_scene_to_file("res://scenes/main/startingNewGame_NewLeader.tscn")

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


func _on_btn_main_menu_continueFromLastSave_pressed() -> void:
	AudioManager.get_node("buttonClick").play() # play button click noise
	AudioManager.get_node("pageTurn").play() #play page turn noise
	pass # Replace with function body.


func _on_btn_mainMenu_loadGame_pressed() -> void:
	AudioManager.get_node("buttonClick").play() # play button click noise
	pass # Replace with function body.


func _on_btn_mainMenu_settingsMenu_pressed() -> void:
	AudioManager.get_node("buttonClick").play() # play button click noise
	pass # Replace with function body.


func _on_btn_mainMenu_creditsMenu_pressed() -> void:
	AudioManager.get_node("buttonClick").play() # play button click noise
	pass # Replace with function body.

func _on_btn_mainMenu_quitToDesktop_pressed() -> void:
	AudioManager.get_node("buttonClick").play() # play button click noise
	pass # Replace with function body.
