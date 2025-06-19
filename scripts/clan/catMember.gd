extends Resource
class_name Member

var id: int 
var name: String
var sex: int
# 0 = male, 1 = female
var age: int
var rank: int
# 0 = leader, 1 = kit, 2 = apprentice, 3 = warrior, 4 = medicine cat, 5 = deputy, 6 = elder
# 7 = rogue, 8 = kittypet (hidden from user's sight)
var genetic_code: String
var prefix: String
var suffix: String
var isPregnant: bool
var pregnancyProgress: int

func getRoleName(rank) -> String: 
	match rank:
		0: return "Leader"
		1: return "Kit"
		2: return "Apprentice"
		3: return "Warrior"
		4: return "Medicine cat"
		5: return "Deputy"
		6: return "Elder"
		_: return "Outsider"
