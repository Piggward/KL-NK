class_name CardUI
extends Control

@export var card : Card
signal reparent_requested(which_card_ui: CardUI)
@onready var card_state_machine = $CardStateMachine as CardStateMachine
@onready var drop_point_detector = $DropPointDetector
@onready var targets: Array[Node] = []
@onready var score_area = $DropPointDetector/ScoreArea
@onready var icon_area = $DropPointDetector/IconArea

const CARD_ICON = preload("res://scenes/card_ui/card_symbols/card_icon.tscn")
const CARD_ICON_NUMBER = preload("res://scenes/card_ui/card_symbols/card_icon_number.tscn")

var parent: Control

# Called when the node enters the scene tree for the first time.
func _ready():
	card_state_machine.init(self)
	initialize_icons(card)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event: InputEvent) -> void:
	card_state_machine.on_input(event)

func _on_mouse_entered():
	card_state_machine.on_mouse_entered()

func _on_mouse_exited():
	card_state_machine.on_mouse_exited()


func _on_gui_input(event) -> void:
	card_state_machine.on_gui_input(event)


func _on_drop_point_detector_area_entered(area):
	if not targets.has(area):
		targets.append(area)

func _on_drop_point_detector_area_exited(area):
	targets.erase(area)

func initialize_icons(card: Card) -> void:
	if card.score > 0:
		var score_icon = CARD_ICON_NUMBER.instantiate()
		score_icon.set_icon("score", card.score)
		score_area.add_child(score_icon)
	if card.skill > 0:
		var skill_icon = CARD_ICON_NUMBER.instantiate()
		skill_icon.set_icon("skill", card.skill)
		icon_area.add_child(skill_icon)
	for i in card.boots:
		var boot_icon := CARD_ICON_NUMBER.instantiate()
		boot_icon.set_icon("boot", 0)
		icon_area.add_child(boot_icon)
	for i in card.swords:
		var sword_icon := CARD_ICON_NUMBER.instantiate()
		sword_icon.set_icon("sword", 0)
		icon_area.add_child(sword_icon)
