class_name DeckPile
extends Resource

@export var cards: Array[Card] = [] 

func empty() -> bool:
	return cards.is_empty()
	
func draw_card() -> Card:
	print("drawing card")
	var card = cards.pop_front()
	return card

func add_card(card: Card):
	cards.append(card)

func shuffle() -> void:
	cards.shuffle()
	
func clear() -> void: 
	cards.clear()
