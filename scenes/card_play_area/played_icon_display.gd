class_name PlayedIconDisplay
extends HBoxContainer
@onready var boots_display = $Boots/amount
@onready var swords_display = $Swords/amount
@onready var skills_display = $Skills/amount

var boots_counter = 0
var swords_counter = 0
var skills_counter = 0

var boots

func _update_icons(boots, swords, skills):
	pass
# Called when the node enters the scene tree for the first time.
func _ready():
	update_display()
	# Alternative have a reference to turnmanager and just get the values from there. 
	Events.card_played.connect(_on_card_played)
	Events.card_removed.connect(_on_card_removed)

func update_display() -> void:
	boots_display.text = str(boots_counter)
	swords_display.text = str(swords_counter)
	skills_display.text = str(skills_counter)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_card_played(card: Card) -> void:
	boots_counter += card.boots
	skills_counter += card.skill
	swords_counter += card.swords
	
	update_display()
	pass
	
func _on_card_removed(card: Card) -> void:
	boots_counter -= card.boots
	skills_counter -= card.skill
	swords_counter -= card.swords
	
	update_display()
	pass
