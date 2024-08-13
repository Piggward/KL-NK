class_name CardUI
extends Control

@export var card : Card
signal reparent_requested(which_card_ui: CardUI)
@onready var color = $Color
@onready var state = $State
@onready var card_state_machine = $CardStateMachine as CardStateMachine
@onready var drop_point_detector = $DropPointDetector
@onready var targets: Array[Node] = []
@onready var icon_area = $IconArea
@onready var score_area = $ScoreArea

const BOOT_ICON = preload("res://scenes/card_ui/card_symbols/boot_icon.tscn")
const SWORD_ICON = preload("res://scenes/card_ui/card_symbols/sword_icon.tscn")
const SKILL_ICON = preload("res://scenes/card_ui/card_symbols/skill_icon.tscn")
const SCORE_ICON = preload("res://scenes/card_ui/card_symbols/score_icon.tscn")

var parent: Control

# Called when the node enters the scene tree for the first time.
func _ready():
	card_state_machine.init(self)
	if card.score > 0:
		var score_icon = SCORE_ICON.instantiate()
		var amount = score_icon.get_child(1)
		amount.text = str(card.score)
		score_area.add_child(score_icon)
	if card.skill > 0:
		var skill_icon := SKILL_ICON.instantiate()
		var amount = skill_icon.get_child(1)
		amount.text = str(card.skill)
		icon_area.add_child(skill_icon)
	for i in card.boots:
		var boot_icon := BOOT_ICON.instantiate()
		icon_area.add_child(boot_icon)
	for i in card.swords:
		var sword_icon := SWORD_ICON.instantiate()
		icon_area.add_child(sword_icon)
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
