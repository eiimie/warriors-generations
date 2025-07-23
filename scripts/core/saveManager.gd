extends Node

const MAX_SLOTS = 5

func saveToSlot(slot: int, clan_data: Dictionary) -> void:
	if slot < 1 or slot > MAX_SLOTS:
		push_error("Invalid save slot number.")
		return
	var path = "user://save_slot%d.json" % slot 
	var file = FileAccess.open(path, FileAccess.WRITE)
	if file: 
		file.store_string(JSON.stringify(clan_data, "\t"))
		file.close()
	saveClanData(slot)

func loadFromSlot(slot: int) -> Dictionary:
	if slot < 1 or slot > MAX_SLOTS:
		push_error("Invalid load slot number.")
		return {}
	var path = "user://save_slot%d.json" % slot
	if FileAccess.file_exists(path):
		var file = FileAccess.open(path, FileAccess.READ)
		var content = file.get_as_text()
		file.close()
		var result = JSON.parse_string(content)
		if typeof(result) == TYPE_DICTIONARY:
			return result
		else:
			push_error("Failed to parse JSON.")
	else:
		push_warning("Save slot is empty")
	return {}

func saveClanData(slot: int) -> void:
	var data = {
		"currentMoon": Global.currentMoon,
		"population": PlayerClan.population,
		"livingCatCount": Global.livingCatCount,
		"leaderId": Global.leaderCat.id,
		"cats": []
	}
	
	for cat in PlayerClan.getAllCats():
		var cat_data = {
			"id": cat.id,
			"name": cat.name,
			"sex": cat.sex,
			"age": cat.age,
			"rank": cat.rank,
			"genetic_code": cat.genetic_code,
			"prefix": cat.prefix,
			"suffix": cat.suffix,
			"isPregnant": cat.isPregnant,
			"pregnancyProgress": cat.pregnancyProgress,
			"primaryPersonality": cat.primaryPersonality,
			"secondaryPersonality": cat.secondaryPersonality,
			"traits": cat.traits,
			"quirk": cat.quirk,
			"moodBias": cat.moodBias
		}
		if cat.rank == 0:
			cat_data["lives"] = cat.lives
		data["cats"].append(cat_data)
	
	var file = FileAccess.open("user://save_slot%d.json" % slot, FileAccess.WRITE)
	file.store_string(JSON.stringify(data, "\t"))
	file.close()
