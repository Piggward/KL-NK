class_name CardPlayArea
extends Area2D

@onready var played_cards = $PlayedCards


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func add_card(cardUI: CardUI):
	cardUI.reparent(played_cards)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
