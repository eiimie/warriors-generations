# member_resource.gd
extends Resource
class_name Member

var id: int 
var name: String
var sex: int
# 0 = male, 1 = female
var age: int
var rank: int
# 0 = leader, 1 = kit, 2 = apprentice, 3 = warrior, 4 = medicine cat, 5 = deputy, 6 = elder
var genetic_code: String
var prefix: String
var suffix: String
var isPregnant: bool
var pregnancyProgress: int
