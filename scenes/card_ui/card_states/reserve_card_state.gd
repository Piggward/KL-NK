class_name ReserveCardState
extends CardState


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func enter():
	TurnManager.update_icons.connect(_on_update_icons)
	pass

# this logic should be moved to shop-container in the future I think.
func _on_update_icons(boots, swords, skill):
	if card_ui.card.type == Card.Type.MONSTER:
		card_ui.set_purchasable(card_ui.card.cost <= swords)
	else:
		card_ui.set_purchasable(card_ui.card.cost <= skill)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse") and card_ui.purchasable:
		Events.card_purchased.emit(card_ui.card)
