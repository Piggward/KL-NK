extends Line2D

const POINTS_COUNT = 11
const POINT_X_OFFSET = 100.0 / POINTS_COUNT
const POINT_Y_OFFSET = 100.0 / POINTS_COUNT

@export var startTile: TileUI
@export var endTile: TileUI
@export var twoWay: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	width = 10.0

	var start = get_tile_center_position(startTile)
	var end = get_tile_center_position(endTile)
	var distance = end - start
	
	add_point(start)
	for i in range (POINTS_COUNT):
		var t = (1.0 / POINTS_COUNT) * i
		var x = start.x + (distance.x / POINTS_COUNT) * i
		var y = start.y + ease_out_cubic(t) * distance.y
		add_point(Vector2(x, y))
	add_point(end)
	
	if twoWay:
		print("is twoWay!")
		width_curve.clear_points()
		#width_curve.min_value = 1.0

func get_tile_center_position(tile: TileUI) -> Vector2:
	var tile_rect = tile.get_global_rect()
	var tile_transform = tile.get_global_transform().get_origin()
	
	return tile_transform + tile_rect.size / 2
	
func ease_out_cubic(val: float) -> float:
	return 1.0 - pow(1.0 - val, 3.0)
	
func min_arc_point_value(val: float, i: int, offset: float) -> float:
	var res = val + abs(i - int(POINTS_COUNT / 2)) * POINT_X_OFFSET
	print(val, " ; ", i, " ; ", offset, " ; ", res)
	return res
