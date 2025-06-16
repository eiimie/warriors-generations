extends Control
var moonCount = 0 

func _ready():
	updateMoonCounter()
	
func updateMoonCounter():
	$moonCounterLabel.text = "Moons: " + str(moonCount)

func on_Game_backToMainMenu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")

func _on_nextMoonButton_pressed():
	moonCount += 1
	updateMoonCounter()
