extends Node

const CARD_UI = preload("res://scenes/card_ui/card_ui.tscn")

signal update_icons(boots: int, swords: int, skills: int)

var reserve: Reserve 
var hand: Hand 

const activePlayerScene = preload("res://scenes/player/player.tscn")
var activePlayer: Player
const STARTING_DECK = preload("res://resources/card_resources/starting_deck.tres")

var played_cards: Array[Card] = []
var currentBoots = 0
var currentSkill = 0
var currentSwords = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.card_played.connect(_on_card_played)
	Events.card_removed.connect(_on_card_removed)
	Events.card_purchased.connect(_on_card_purchased)
	Events.turn_ended.connect(_on_turn_ended)
	reserve = get_tree().get_nodes_in_group("reserve")[0]
	hand = get_tree().get_nodes_in_group("hand")[0]
	pass # Replace with function body.

func start_turn():
	var tileNodeID = MapController.players[activePlayer.get_instance_id()].pos
	var test = instance_from_id(tileNodeID)
	var tileState = instance_from_id(tileNodeID).tile_state_machine.current_state
	tileState.transition_requested.emit(tileState, TileState.State.SELECTED)
	for i in 5:
		if(activePlayer.deck.cards.size() == 0):
			activePlayer.deck = activePlayer.discard_pile
			activePlayer.discard_pile.empty()
			activePlayer.deck.shuffle()
		var card = activePlayer.deck.draw_card()
		hand.add_card(card)

func _on_card_played(card: Card) -> void:
	print("card played: ", card.name)
	played_cards.append(card)
	update_values(card.boots, card.swords, card.skill)
	update_shop()
	pass
	
func _on_card_removed(card: Card) -> void:
	update_values(-card.boots, -card.swords, -card.skill)
	update_shop()
	pass

func _on_card_purchased(card: Card):
	if card.type == Card.Type.MONSTER:
		print("monster defeated: ", card.name);
		currentSwords -= card.cost
		update_shop()
		return
	
	if card.type == Card.Type.DUNGEON or card.type == Card.Type.RESERVE:
		print("card purchased: ", card.name)
		if currentSkill < card.cost:
			return
		currentSkill -= card.cost
		update_shop()
		activePlayer.discard_pile.add_card(card)

func _on_turn_ended():
	if hand.get_children().size() > 0:
		print("hand not empty")
		return
	for card in played_cards:
		activePlayer.discard_pile.add_card(card)
		
	played_cards.clear()
	reset_values()
	start_turn()
	

func update_values(boots: int, swords: int, skill: int):
	currentBoots += boots
	currentSwords += swords
	currentSkill += skill
	update_icons.emit(currentBoots, currentSwords, currentSkill)
	
func reset_values():
	currentBoots = 0
	currentSwords = 0
	currentSkill = 0
	update_icons.emit(0, 0, 0)

func update_shop():
	for child in reserve.get_children():
		if child is CardUI:
			var cardUI := child as CardUI
			if cardUI.card.type == Card.Type.MONSTER:
				cardUI.set_purchasable(cardUI.card.cost <= currentSwords)
			else:
				cardUI.set_purchasable(cardUI.card.cost <= currentSkill)
			


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
