# gui_helper.gd
extends Node
class_name GUIHelper

const PlayerClan = preload("res://scripts/clan/playerClan.gd")

# Get the full name of a cat (prefix + suffix)
static func getCatName(player_clan: PlayerClan, cat_id: int) -> String:
	var cat: Member = player_clan.get_cat(cat_id)
	if cat:
		return cat.prefix + cat.suffix
	return "Unknown"

# Get the age of a cat
static func getCatAge(player_clan: PlayerClan, cat_id: int) -> int:
	var cat: Member = player_clan.get_cat(cat_id)
	if cat:
		return cat.age
	return -1

# Get the rank of a cat as a string
static func getCatRank(player_clan: PlayerClan, cat_id: int) -> String:
	var cat: Member = player_clan.get_cat(cat_id)
	if cat:
		match cat.rank:
			0: return "Leader"
			1: return "Kit"
			2: return "Apprentice"
			3: return "Warrior"
			4: return "Medicine Cat"
			5: return "Deputy"
			6: return "Elder"
			_: return "Unknown"
	return "Unknown"

# Get the sex of a cat as a string (Tom or Molly)
static func getCatSex(player_clan: PlayerClan, cat_id: int) -> String:
	var cat: Member = player_clan.get_cat(cat_id)
	if cat:
		return "Tom" if cat.sex == 0 else "Molly"
	return "Unknown"

# Get the pronouns of a cat (She/Her or He/His)
static func getCatPronouns(player_clan: PlayerClan, cat_id: int) -> String:
	var cat: Member = player_clan.get_cat(cat_id)
	if cat:
		return "she/her" if cat.sex == 1 else "he/his"
	return "Unknown"
