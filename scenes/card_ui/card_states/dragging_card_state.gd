extends CardState

func enter() -> void:
	#Make sure parent exists before we set it 
	var ui_layer = get_tree().get_first_node_in_group("ui_layer")
	if(ui_layer):
		card_ui.reparent(ui_layer)
	
	card_ui.color.color = Color.BLUE
	card_ui.state.text ="DRAGGING"
	

func exit() -> void:
	pass

func on_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		card_ui.global_position = card_ui.get_global_mouse_position() - card_ui.pivot_offset
	
	elif event.is_action_pressed("left_mouse") or event.is_action_released("left_mouse"):
		transition_requested.emit(self, CardState.State.RELEASED)
	
	elif event.is_action_pressed("right_mouse"):
		transition_requested.emit(self, CardState.State.BASE)
	pass

func on_gui_input(event: InputEvent) -> void:
	pass


func on_mouse_entered() -> void:
	pass # Replace with function body.


func on_mouse_exited() -> void:
	pass # Replace with function body.
