extends Resource
class_name Member

var id: int 
var name: String
var sex: int # 0 = male, 1 = female
var age: int
var rank: int # 0 = leader, 1 = kit, 2 = apprentice, 3 = warrior, 4 = medicine cat, 5 = deputy, 6 = elder
var genetic_code: String
var prefix: String
var suffix: String
var isPregnant: bool
var pregnancyProgress: int
var primaryPersonality : int 
var secondaryPersonality : int
var traits : Array = []
var quirk : String
var mood_bias : String

# returns what role they are 
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

# returns pronouns
func getSheHe(Member, pronoun) -> String:
	# returns pronouns
	# 0 = subject, she/he/they
	# 1 = object, her/him/them
 	# 2 = poss. adj., her/his/their
	# 3 = poss. pronoun, hers/his/theirs
	# 4 = reflexive, herself/himself/themself
	match pronoun:
		"0":
			if Member.sex == "0":
				return "he"
			else:
				return "she"
		"1":
			if Member.sex == "0":
				return "him"
			else:
				return "her"
		"2":
			if Member.sex == "0":
				return "his"
			else:
				return "her"
		"3": 
			if Member.sex == "0":
				return "his"
			else:
				return "hers"
		"4":
			if Member.sex == 0:
				return "himself"
			else:
				return "herself"
	return "they/them/their"

# change prefix
# change suffix
func changePrefix(Member, newPrefix):
	Member.prefix = newPrefix
	Member.name = Member.prefix + Member.suffix
