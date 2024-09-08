extends TileState

func enter() -> void:
	tile_ui.color.color = Color.CHARTREUSE

func on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse"):
		# Update player location and move instance
		# TODO: make TurnManager autoloaded instead so we can easily get active_player?
		var active_player = get_tree().get_first_node_in_group("player")
		MapController.move_player_to_tile(active_player, tile_ui)
		# Send signal that we took a step (TODO: this doesnt feel right, should be handled some other way)
		TurnManager.decrease_boots.emit(1)
		# Update tilestate
		transition_requested.emit(self, TileState.State.SELECTED)
