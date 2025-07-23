extends Control

@onready var nameLabel = $ui_portraitBox/VBoxContainer/memberName_label
@onready var ageLabel = $ui_portraitBox/VBoxContainer/memberAge_label
@onready var roleLabel = $ui_portraitBox/VBoxContainer/memberRole_label
@onready var portrait = $ui_portraitBox/CenterContainer/catPortrait
@onready var descriptionLabel = $ui_portraitBox/VBoxContainer/description_label

func displayMember(member: Member) -> void:
	if member == null:
		push_error("displayMember() called with null member!")
		return
	if member.name == null:
		push_error("member.name is null!")
		return
	print("Displaying member:", member.name)
	print("Member:", member)
	print("Member name:", member.name)
	print("Member type:", typeof(member.name))
	nameLabel.text = member.name 
	ageLabel.text = str(member.age) + " moons old"
	roleLabel.text = (member.getRoleName(member.rank).to_lower())
	if member.rank == 0:
		descriptionLabel.text = "this is you"
	else:
		descriptionLabel.text = Appearance.describeThisCat(member.genetic_code)
	portrait.displayCat(member.genetic_code)

func refresh(cat: Member) -> void:
	displayMember(cat)

func _ready() -> void:
	print("nameLabel:", nameLabel)
	print("portrait:", portrait)
