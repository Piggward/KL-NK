class_name ShopContainer
extends HBoxContainer

const CARD_UI = preload("res://scenes/card_ui/card_ui.tscn")
const EXPLORE = preload("res://resources/card_resources/cards/Reserve/explore.tres")
const MERCENARY = preload("res://resources/card_resources/cards/Reserve/mercenary.tres")
const MYSTERIOUS_TOME = preload("res://resources/card_resources/cards/Reserve/mysterious_tome.tres")
const GOBLIN = preload("res://resources/card_resources/cards/Reserve/goblin.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	add_card(EXPLORE)
	add_card(MERCENARY)
	add_card(MYSTERIOUS_TOME)
	add_card(GOBLIN)
	pass # Replace with function body.

func add_card(card: Card):
	var card_UI = CARD_UI.instantiate()
	add_child(card_UI)
	card_UI.parent = self
	card_UI.card = card
	card_UI.init()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
