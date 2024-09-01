class_name Player
extends Node

@export var deck : DeckPile
var draw_pile := DeckPile.new()
var discard_pile := DeckPile.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func draw_cards(number_of_cards: int) -> Array[Card]:
	var drawn_cards: Array[Card] = []
	for i in number_of_cards:
		if(deck.cards.size() == 0):
			deck = discard_pile
			discard_pile.empty()
			deck.shuffle()
		drawn_cards.append(deck.draw_card())
	return drawn_cards
