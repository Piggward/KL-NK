extends CardState

# These variables will prevent a bug where the 
# left mouse button clicked event is registered
# as both a button clicked and button released.
const DRAG_MINIMUM_THRESHOLD := 0.07

var minimum_drag_time_elapsed := false

func enter() -> void:
	#Make sure parent exists before we set it 
	var ui_layer = get_tree().get_first_node_in_group("ui_layer")
	if(ui_layer):
		card_ui.reparent(ui_layer)
	
	card_ui.color.color = Color.BLUE
	card_ui.state.text ="DRAGGING"
	
	# When you enter this state a timer for DRAG_MINIMUM_THRESHOLD time is started.
	minimum_drag_time_elapsed = false
	var threshold_timer := get_tree().create_timer(DRAG_MINIMUM_THRESHOLD, false)
	threshold_timer.timeout.connect(func(): minimum_drag_time_elapsed = true)

func exit() -> void:
	pass

func on_input(event: InputEvent) -> void:
	print(can_release())
	var mouse_motion := event is InputEventMouseMotion
	var cancel :=  event.is_action_pressed("right_mouse")
	var release := event.is_action_pressed("left_mouse") or event.is_action_released("left_mouse")
	
	if mouse_motion:
		card_ui.global_position = card_ui.get_global_mouse_position() - card_ui.pivot_offset
	
	# We dont release the card unless the timer has lapsed out. 
	elif release and minimum_drag_time_elapsed:
		if(not can_release()):
			card_ui.state.text = "CANT HERE!"
		else:
			transition_requested.emit(self, CardState.State.RELEASED)
	
	elif cancel:
		transition_requested.emit(self, CardState.State.BASE)
	pass

func on_gui_input(event: InputEvent) -> void:
	pass

func can_release() -> bool:
	print("checking if can release")
	return card_ui.targets.any(is_releasable_area)

func is_releasable_area(area) -> bool:
	print(area.name)
	return area.name == "CardPlayArea"

func on_mouse_entered() -> void:
	pass # Replace with function body.


func on_mouse_exited() -> void:
	pass # Replace with function body.
