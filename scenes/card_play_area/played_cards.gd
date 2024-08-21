class_name PlayedCards
extends HBoxContainer

var cards = DeckPile.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_card(card: Card):
	cards.add_card(card)

func empty():
	for child in get_children():
		if child is CardUI:
			var cardUI := child as CardUI
			cardUI.queue_free()
	cards.clear()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
