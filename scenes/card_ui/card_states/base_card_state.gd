extends CardState

func enter() -> void:
	card_ui.color.color = Color.BROWN
	card_ui.state.text = "base"
	pass

func exit() -> void:
	pass

func on_input(event: InputEvent) -> void:
	pass

func on_gui_input(event: InputEvent) -> void:
	
	if event.is_action_pressed("left_mouse"):
		card_ui.pivot_offset = card_ui.get_global_mouse_position() - card_ui.global_position
		transition_requested.emit(self, CardState.State.CLICKED)

func on_mouse_entered() -> void:
	card_ui.color.color = Color.LIGHT_CORAL
	card_ui.state.text ="dont touch me"
	
func on_mouse_exited() -> void:
	card_ui.color.color = Color.BROWN
	card_ui.state.text = "base"
