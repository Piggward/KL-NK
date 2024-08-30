class_name ReserveCardState
extends CardState


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func enter():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse") and card_ui.purchasable:
		Events.card_purchased.emit(card_ui.card)
