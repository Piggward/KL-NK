extends TileState

# Called when the node enters the scene tree for the first time.
func enter() -> void:
	tile_ui.color.color = Color.CHARTREUSE
	
func on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse"):
		Events.tiles_reset_all.emit(self)
		transition_requested.emit(self, TileState.State.FOCUSED)
