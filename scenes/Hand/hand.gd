class_name Hand
extends HBoxContainer
const CARD_UI = preload("res://scenes/card_ui/card_ui.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is CardUI:
			var cardUI := child as CardUI
			cardUI.parent = self
			cardUI.reparent_requested.connect(on_card_ui_reparent_requested)
			
func add_cards(cards: Array[Card]):
	for card in cards:
		var card_UI = CARD_UI.instantiate()
		add_child(card_UI)
		card_UI.parent = self
		card_UI.card = card
		card_UI.reparent_requested.connect(on_card_ui_reparent_requested)
		card_UI.init()

func on_card_ui_reparent_requested(child: CardUI) -> void:
	child.reparent(self)
