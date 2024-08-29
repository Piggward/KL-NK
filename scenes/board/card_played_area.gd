class_name CardPlayArea
extends Area2D

@onready var played_cards = $PlayedCards

func add_card(cardUI: CardUI):
	cardUI.reparent(played_cards)
