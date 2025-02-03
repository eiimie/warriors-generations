extends Node

var currentMoon = 0

# Your moon management code here
func increment_moon():
	Global.currentMoon += 1
	print("Current Moon: ", Global.current_moon)
