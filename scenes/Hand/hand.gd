class_name Hand
extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is CardUI:
			var cardUI := child as CardUI
			cardUI.parent = self
			cardUI.reparent_requested.connect(on_card_ui_reparent_requested)
			

func on_card_ui_reparent_requested(child: CardUI) -> void:
	child.reparent(self)
