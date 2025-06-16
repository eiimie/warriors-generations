extends Control

func _on_StartGame_StartButton_up():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
