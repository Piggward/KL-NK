class_name TurnManager
extends Node

signal update_icons(boots: int, swords: int, skills: int)

var currentBoots: int
var currentSkill: int
var currentSwords: int

# Called when the node enters the scene tree for the first time.
func _ready():
	currentBoots = 0
	currentSkill = 0
	currentSwords = 0
	Events.card_played.connect(_on_card_played)
	Events.card_removed.connect(_on_card_removed)
	pass # Replace with function body.

func _on_card_played(card: Card) -> void:
	currentBoots += card.boots
	currentSkill += card.skill
	currentSwords += card.swords
	
	update_icons.emit(currentBoots, currentSwords, currentSkill)
	pass
	
func _on_card_removed(card: Card) -> void:
	currentBoots -= card.boots
	currentSkill -= card.skill
	currentSwords -= card.swords
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
