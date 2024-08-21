class_name PlayedIconDisplay
extends HBoxContainer
@onready var boots_display = $Boots/amount
@onready var swords_display = $Swords/amount
@onready var skills_display = $Skills/amount
@onready var turn_manager = $"../../TurnManager"

func _update_icons(boots, swords, skills):
	pass
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	boots_display.text = str(turn_manager.currentBoots)
	swords_display.text = str(turn_manager.currentSwords)
	skills_display.text = str(turn_manager.currentSkill)
	pass
