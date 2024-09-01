extends Node

const CARD_UI = preload("res://scenes/card_ui/card_ui.tscn")

signal update_icons(boots: int, swords: int, skills: int)

@onready var reserve = get_tree().get_nodes_in_group("reserve")[0]
@onready var hand = get_tree().get_nodes_in_group("hand")[0]

var activePlayer: Player

var currentBoots = 0
var currentSkill = 0
var currentSwords = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	connect_to_events()
	pass # Replace with function body.

func start_turn():
	var drawn_cards = activePlayer.draw_cards(5)
	hand.add_cards(drawn_cards)			

func _on_card_played(card: Card) -> void:
	print("card played: ", card.name)
	activePlayer.discard_pile.cards.append(card)
	update_values(currentBoots+card.boots, currentSwords+card.swords, currentSkill+card.skill)
	pass
	
func _on_card_removed(card: Card) -> void:
	update_values(currentBoots-card.boots, currentSwords-card.swords, currentSkill-card.skill)
	pass

func _on_card_purchased(card: Card):
	if card.type == Card.Type.MONSTER:
		print("monster defeated: ", card.name);
		update_values(currentBoots, currentSwords-card.cost, currentSkill)
		return
	
	if card.type == Card.Type.DUNGEON or card.type == Card.Type.RESERVE:
		if currentSkill < card.cost:
			return
		print("card purchased: ", card.name)
		activePlayer.discard_pile.add_card(card)
		update_values(currentBoots, currentSwords, currentSkill - card.cost)
	

func _on_try_end_turn():
	if hand.get_children().size() > 0:
		print("hand not empty")
		return
	else:
		Events.end_turn.emit()
		update_values(0, 0, 0)
		

func update_values(boots: int, swords: int, skill: int):
	currentBoots = boots
	currentSwords = swords
	currentSkill = skill
	update_icons.emit(currentBoots, currentSwords, currentSkill)

func connect_to_events():
	Events.card_played.connect(_on_card_played)
	Events.card_removed.connect(_on_card_removed)
	Events.card_purchased.connect(_on_card_purchased)
	Events.try_end_turn.connect(_on_try_end_turn)
