extends Button

func _on_NextMoonButton_pressed():
	Global.incrementMoon()
	print("Current moon: ", Global.currentMoon)
	Global.processMoonEvents()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
