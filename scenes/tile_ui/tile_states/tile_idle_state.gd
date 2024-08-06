extends TileState

func enter() -> void:
	if not tile_ui.is_node_ready():
		await tile_ui.ready

	tile_ui.color.color = Color.AQUA
#
func on_mouse_entered() -> void:
	transition_requested.emit(self, TileState.State.FOCUSED)
