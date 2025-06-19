extends Node2D

@onready var nameLabel = $Panel/VBoxContainer/memberName_label
@onready var ageLabel = $Panel/VBoxContainer/memberAge_label
@onready var roleLabel = $Panel/VBoxContainer/memberRole_label
@onready var portrait = $Panel/PanelContainer/catPortrait
@onready var descriptionLabel = $Panel/VBoxContainer/description_label

func displayMember(member: Member) -> void:
	nameLabel.text = member.name 
	ageLabel.text = str(member.age)
	roleLabel.text = member.getRoleName(member.rank)
	descriptionLabel.text = Appearance.describeThisCat(member.genetic_code)
	portrait.displayCat(member.genetic_code)
