extends TileState

# Called when the node enters the scene tree for the first time.
func enter() -> void:
	tile_ui.update_available_neighbouring_tiles()
	tile_ui.color.color = Color.AQUA
