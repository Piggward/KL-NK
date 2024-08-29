extends TileState

func enter() -> void:
	if not tile_ui.is_node_ready():
		await tile_ui.ready

	tile_ui.color.color = Color.FIREBRICK
