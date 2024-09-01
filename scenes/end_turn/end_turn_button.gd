class_name EndTurnButton
extends Control
@onready var label = $Label

var minimum_time_elapsed := false
const MINIMUM_THRESHOLD := 0.07

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = "start game"
	Events.start_game.connect(_on_start_game)
	
	minimum_time_elapsed = false
	var threshold_timer := get_tree().create_timer(MINIMUM_THRESHOLD, false)
	threshold_timer.timeout.connect(func(): minimum_time_elapsed = true)
	pass # Replace with function body.


func _on_start_game():
	label.text = "end turn"
	pass


func _on_gui_input(event):
	if event.is_action_pressed("left_mouse") && minimum_time_elapsed:
		if not GameManager.game_has_started:
			Events.try_start_game.emit()
			return
		Events.try_end_turn.emit()

	pass # Replace with function body.
