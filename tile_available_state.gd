extends TileState

func enter() -> void:
	tile_ui.color.color = Color.AQUA
#
func on_mouse_entered() -> void:
	transition_requested.emit(self, TileState.State.FOCUSED)
