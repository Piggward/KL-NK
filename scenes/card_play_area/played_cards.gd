class_name PlayedCards
extends HBoxContainer

var cards: Array[Card] = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_card(card: Card):
	cards.append(card)
	
func discard_cards():
	cards.clear()

func empty():
	for child in get_children():
		if child is CardUI:
			var cardUI := child as CardUI
			cardUI.queue_free()
	cards.clear()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
