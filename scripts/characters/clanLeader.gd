class_name Leader

extends Member

var lives: int

func printInfo():
	print("Name: ", name)
	print("Lives: ", lives)
	print("Sex: ", sex)
	print("Age: ", age)
	print("Rank: ", rank)
	print("Genetic Code: ", genetic_code)
	print("Prefix: ", prefix)
	print("Suffix: ", suffix)

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
