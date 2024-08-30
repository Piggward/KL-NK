extends Line2D

@export var start_tile: TileUI
@export var end_tile: TileUI
@export var two_way: bool = true

func _ready():
	# Add roads to tiles, this is done to easier calculate neighbours
	start_tile.exit_roads.append(self)
	if two_way:
		end_tile.exit_roads.append(self)
	
	# TODO: break out below in to seperate drawing function
	var start = get_tile_center_position(start_tile)
	var end = get_tile_center_position(end_tile)
	
	add_point(start)
	add_point(end)

func get_tile_center_position(tile: TileUI) -> Vector2:
	var tile_rect = tile.get_global_rect()
	var tile_transform = tile.get_global_transform().get_origin()
	
	return tile_transform + tile_rect.size / 2
