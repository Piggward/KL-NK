class_name PlayedIconDisplay
extends HBoxContainer
@onready var boots_display = $Boots/amount
@onready var swords_display = $Swords/amount
@onready var skills_display = $Skills/amount
@onready var turn_manager = $"../TurnManager"

func _update_icons(boots, swords, skills):
	boots_display.text = str(boots)
	swords_display.text = str(swords)
	skills_display.text = str(skills)
	pass
# Called when the node enters the scene tree for the first time.
func _ready():
	boots_display.text = str(0)
	swords_display.text = str(0)
	skills_display.text = str(0)
	TurnManager.update_icons.connect(_update_icons)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
