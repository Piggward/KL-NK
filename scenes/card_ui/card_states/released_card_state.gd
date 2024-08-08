extends CardState

func enter() -> void:
	card_ui.color.color = Color.DARK_SALMON
	card_ui.state.text = "released"
	pass

func exit() -> void:
	pass

func on_input(_event: InputEvent) -> void:
	pass

func on_gui_input(_event: InputEvent) -> void:
	pass


func on_mouse_entered() -> void:
	pass # Replace with function body.


func on_mouse_exited() -> void:
	pass # Replace with function body.
