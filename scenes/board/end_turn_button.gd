extends Control


func _on_gui_input(event):
	if event.is_action_pressed("left_mouse"):
		Events.turn_ended.emit()
