extends CardState

const DRAG_MINIMUM_THRESHOLD := 0.07

var minimum_drag_time_elapsed := false

func enter() -> void:
	# set position
	var card_area = card_ui.targets.front()
	card_area.add_card(card_ui)
	
	# emit card played event
	Events.card_played.emit(card_ui.card)
	
	# start timer for further inputs
	minimum_drag_time_elapsed = false
	var threshold_timer := get_tree().create_timer(DRAG_MINIMUM_THRESHOLD, false)
	threshold_timer.timeout.connect(func(): minimum_drag_time_elapsed = true)
	
	card_ui.glow_panel.set("theme_override_styles/panel", card_ui.EMPTY_STYLE)
	pass

func exit() -> void:
	pass

func on_input(_event: InputEvent) -> void:
	pass

func on_gui_input(_event: InputEvent) -> void:
	if _event.is_action_pressed(("left_mouse")) and minimum_drag_time_elapsed:
		transition_requested.emit(self, CardState.State.BASE)
		Events.card_removed.emit(card_ui.card)
	pass


func on_mouse_entered() -> void:
	pass # Replace with function body.


func on_mouse_exited() -> void:
	pass # Replace with function body.
