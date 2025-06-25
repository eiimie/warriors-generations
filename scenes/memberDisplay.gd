extends Control

@onready var nameLabel = $Panel/VBoxContainer/memberName_label
@onready var ageLabel = $Panel/VBoxContainer/memberAge_label
@onready var roleLabel = $Panel/VBoxContainer/memberRole_label
@onready var portrait = $Panel/PanelContainer/catPortrait
@onready var descriptionLabel = $Panel/VBoxContainer/description_label

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
	ageLabel.text = str(member.age)
	roleLabel.text = member.getRoleName(member.rank)
	descriptionLabel.text = Appearance.describeThisCat(member.genetic_code)
	portrait.displayCat(member.genetic_code)

func refresh(cat: Member) -> void:
	displayMember(cat)

func _ready() -> void:
	print("nameLabel:", nameLabel)
	print("portrait:", portrait)
