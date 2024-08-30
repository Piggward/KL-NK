extends Control

var count = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_gui_input(event):
	if event.is_action_pressed("left_mouse"):
		if count == 0:
			TurnManager.start_turn()
			count += 1
		Events.turn_ended.emit()

	pass # Replace with function body.
