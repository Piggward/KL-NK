extends Node

@export var players: Dictionary # of Player
@onready var start_tile = $StartTile # TODO: fixme, could use $StartTile

# Called when the node enters the scene tree for the first time.
func _ready():
	# TODO: initiate MapController-scene with players/etc from some sort of game manager?
	var _players = get_tree().get_nodes_in_group("player")

	players = {}
	for player in _players:
		print("!!!", start_tile)
		var start_tile_id = start_tile.get_instance_id()
		print("start_tile", start_tile_id)
		players[player.get_instance_id()] = {"pos": start_tile_id}

	print(players)
