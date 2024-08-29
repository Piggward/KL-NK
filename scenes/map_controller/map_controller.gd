extends Node

@export var players: Dictionary # of Player

func _ready():
	# TODO: inte jättenöjd med hur det är byggt... kommer nog ändras när migreringen med turnmanager påbörjas :smile:
	var _players = get_tree().get_nodes_in_group("player")

	players = {}
	for player in _players:
		players[player.get_instance_id()] = {"pos": 0} # start_tile_id, or something idk

func set_start_tile(tile_id: int) -> void:
	for player in players:
		players[player]["pos"] = tile_id
		# Move all players to start
		move_player_to_tile(instance_from_id(player), instance_from_id(tile_id))

func move_player_to_tile(player: Player, tile: TileUI) -> void:
	var new_pos = tile.global_position
	# Center player within tile
	var tileSize = tile.get_node("ClickArea/CollisionShape2D").get_shape().get_size()
	#var centerOffset = Vector2(tileRect.dime)
	new_pos += Vector2(tileSize.x / 2, tileSize.y / 2)
	player.position = new_pos
