class_name TurnManager
extends Node

const CARD_UI = preload("res://scenes/card_ui/card_ui.tscn")

signal update_icons(boots: int, swords: int, skills: int)

@onready var shop_container = $"../Shop/ShopContainer"
@onready var played_cards = $"../CardPlayArea/PlayedCards"
@onready var hand = $"../BoardUI/Hand"

@export var activePlayer: Player

var currentBoots: int
var currentSkill: int
var currentSwords: int

# Called when the node enters the scene tree for the first time.
func _ready():
	reset_values()
	Events.card_played.connect(_on_card_played)
	Events.card_removed.connect(_on_card_removed)
	Events.card_purchased.connect(_on_card_purchased)
	Events.turn_ended.connect(_on_turn_ended)
	activePlayer.deck.shuffle()
	start_turn()

func start_turn():
	print("*", MapController.players)
	for i in 5:
		if (activePlayer.deck.cards.size() == 0):
			activePlayer.deck = activePlayer.discard_pile
			activePlayer.discard_pile.empty()
			activePlayer.deck.shuffle()
		var card = activePlayer.deck.draw_card()
		hand.add_card(card)

func _on_card_played(card: Card) -> void:
	played_cards.add_card(card)
	currentBoots += card.boots
	currentSkill += card.skill
	currentSwords += card.swords
	update_shop()
	pass
	
func _on_card_removed(card: Card) -> void:
	currentBoots -= card.boots
	currentSkill -= card.skill
	currentSwords -= card.swords
	update_shop()
	pass

func _on_card_purchased(card: Card):
	if currentSkill < card.cost:
		return
	currentSkill -= card.cost
	update_shop()
	activePlayer.discard_pile.add_card(card)

func _on_turn_ended():
	for card in played_cards.cards.cards:
		activePlayer.discard_pile.add_card(card)
		
	played_cards.empty()
	reset_values()
	start_turn()
	

func reset_values():
	currentBoots = 0
	currentSkill = 0
	currentSwords = 0

func update_shop():
	for child in shop_container.get_children():
		if child is CardUI:
			var cardUI := child as CardUI
			cardUI.purchasable = cardUI.card.cost <= currentSkill
