extends Node

class_name playerClan 

var cats: Dictionary = {}

# add a new cat to the clan 
func addNewCatToClan(catId: int, catName: String, catSex: int, catAge: int, 
catRank: int, catGenCode: String, catPrefix: String, catSuffix: String, 
catIsPregnant: bool, catPregProgress: int) -> Member:
	var newCat = Member.new()
	
	# set cat's properties
	newCat.id = catId
	newCat.name = catName
	newCat.sex = catSex
	newCat.age = catAge
	newCat.rank = catRank
	newCat.genetic_code = catGenCode
	newCat.prefix = catPrefix
	newCat.suffix = catSuffix
	newCat.isPregnant = catIsPregnant
	newCat.pregnancyProgress = catPregProgress
	
	addCatToClan(newCat)
	
	return newCat

func addCatToClan(cat: Member) -> void:
	cats[cat.id] = cat

func removeCatFromClan(cat_id: int) -> void:
	cats.erase(cat_id)

func getCat(cat_id: int) -> Member:
	return cats.get(cat_id)

# get all cats in the clan 

func getAllCats() -> Array:
	return cats.values()

# get all living cats
func getLivingCats() -> Array:
	return cats.values().filter(func(cat): return cat.rank != -1)  # rank = -1 means dead

# Get all dead cats
func getDeadCats() -> Array:
	return cats.values().filter(func(cat): return cat.rank == -1)  # rank = -1 means dead
