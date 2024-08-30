extends CardState

func enter() -> void:
	if not card_ui.is_node_ready():
		await card_ui.ready
	card_ui.reparent_requested.emit(card_ui)

	pass

func exit() -> void:
	pass

func on_input(event: InputEvent) -> void:
	pass

func on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse"):
		Events.card_played.emit(card_ui.card)
		#Just nu tar vi bara bort kortet när det spelas, i framtiden kanske vi vill göra det möjligt att ångra eller se vilka kort man spelat.
		#transition_requested.emit(self, CardState.State.PLAYED)
		card_ui.queue_free()

func on_mouse_entered() -> void:
	card_ui.glow_panel.set("theme_override_styles/panel", card_ui.BLUE_STYLE)
	pass
	
func on_mouse_exited() -> void:
	card_ui.glow_panel.set("theme_override_styles/panel", card_ui.EMPTY_STYLE)
	pass
