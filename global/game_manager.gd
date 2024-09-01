extends Node

var players: Array[Player] = []
var numberOfPlayers = 1
var game_has_started = false
const STARTING_DECK = preload("res://resources/card_resources/starting_deck.tres")
const PLAYER = preload("res://scenes/player/player.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	connect_to_events()
	# add number of player (hard coded to 1 at the moment)
	for i in numberOfPlayers:
		add_new_player()
	
	pass # Replace with function body.

func add_new_player():
	var player = PLAYER.instantiate()
	player.deck = STARTING_DECK
	player.deck.shuffle()
	players.append(player)
	pass
	
# called from end-turn-button.
# this is just so that GameManager is the one who actually starts the game.
func _on_try_start_game():
	Events.start_game.emit()

func _on_start_game():
	# This way, GameManager can have control over which order to start stuff in.
	TurnManager.activePlayer = players[0]
	MapController.start()
	
	TurnManager.start_turn()
	game_has_started = true

func _on_end_turn():
	# Here we will refill the shop if any cards are missing, perform dragon attacks
	# and so on, but for now we just start a new turn
	set_next_player()
	TurnManager.start_turn()

func set_next_player():
	var currentPlayer = players.pop_front()
	players.append(currentPlayer)
	TurnManager.activePlayer = players[0]
	

func connect_to_events():
	Events.end_turn.connect(_on_end_turn)
	Events.start_game.connect(_on_start_game)
	Events.try_start_game.connect(_on_try_start_game)
