extends Node

var players: Dictionary # of Player
#const STARTING_DECK = preload("res://resources/card_resources/starting_deck.tres")
#const PLAYER = preload("res://scenes/player/player.tscn")
var start_tile: TileUI

func _ready():
	pass

func start():
	# TODO: inte jättenöjd med hur det är byggt... kommer nog ändras när migreringen med turnmanager påbörjas :smile:
	#var _players = get_tree().get_nodes_in_group("player")
	players[TurnManager.activePlayer.get_instance_id()] = {"pos": 0}
	#players = {}
	#for player in _players:
		#players[player.get_instance_id()] = {"pos": 0} # start_tile_id, or something idk
	set_start_tile(start_tile.get_instance_id())
	var tileNodeID = players[TurnManager.activePlayer.get_instance_id()].pos
	var tileState = instance_from_id(tileNodeID).tile_state_machine.current_state
	tileState.transition_requested.emit(tileState, TileState.State.SELECTED)

func set_start_tile(tile_id: int) -> void:
	for player in players:
		players[player]["pos"] = tile_id
		# Move all players to start
		move_player_to_tile(instance_from_id(player), instance_from_id(tile_id))

func move_player_to_tile(player: Player, tile: TileUI) -> void:
	var new_pos = tile.global_position
	# Center player within tile
	var tileSize = tile.get_node("ClickArea/CollisionShape2D").get_shape().get_size()
	new_pos += Vector2(tileSize.x / 2, tileSize.y / 2)
	player.position = new_pos
