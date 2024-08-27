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
		if (card_ui.get_parent().name == "Hand"):
			card_ui.pivot_offset = card_ui.get_global_mouse_position() - card_ui.global_position
			transition_requested.emit(self, CardState.State.CLICKED)
		elif (card_ui.purchasable and card_ui.get_parent().name == "ShopContainer"):
			Events.card_purchased.emit(card_ui.card)
			if card_ui.card.type != Card.Type.RESERVE and card_ui.card.name != "Goblin":
				card_ui.queue_free()
			

func on_mouse_entered() -> void:
	pass
	
func on_mouse_exited() -> void:
	pass
