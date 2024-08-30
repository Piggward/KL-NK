class_name PlayedCards
extends HBoxContainer

var cards = DeckPile.new()

func add_card(card: Card):
	cards.add_card(card)

func empty():
	for child in get_children():
		if child is CardUI:
			var cardUI := child as CardUI
			cardUI.queue_free()
	cards.clear()
