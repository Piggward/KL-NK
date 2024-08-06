extends TileState

func enter() -> void:
	tile_ui.color.color = Color.FIREBRICK
	
func on_mouse_exited() -> void:
	transition_requested.emit(self, TileState.State.IDLE)

func on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse"):
		transition_requested.emit(self, TileState.State.SELECTED)
