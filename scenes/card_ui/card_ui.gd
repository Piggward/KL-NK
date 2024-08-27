class_name CardUI
extends Control

@export var card : Card
signal reparent_requested(which_card_ui: CardUI)
@onready var card_state_machine = $CardStateMachine as CardStateMachine
@onready var drop_point_detector = $DropPointDetector
@onready var targets: Array[Node] = []
@onready var score_area = $ScoreArea
@onready var icon_area = $DropPointDetector/IconArea
@onready var cost_area = $DropPointDetector/CostArea
@onready var purchasable = false
@onready var removeable = false
@onready var card_background_color = $CardBackgroundColor
@onready var card_color = $CardColor
@onready var display_name = $DisplayName
@onready var display_effect = $DisplayEffect

const CARD_ICON = preload("res://scenes/card_ui/card_symbols/card_icon.tscn")

var parent: Control

# Called when the node enters the scene tree for the first time.
func _ready():
	card_state_machine.init(self)
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

func init():
	initialize_icons()
	set_color()
	display_name.text = card.name
	display_effect.text = card.effect

func _on_gui_input(event) -> void:
	card_state_machine.on_gui_input(event)


func _on_drop_point_detector_area_entered(area):
	if not targets.has(area):
		targets.append(area)

func _on_drop_point_detector_area_exited(area):
	targets.erase(area)

func initialize_icons() -> void:
	if card.type == Card.Type.MONSTER:
		initialize_icon("sword", card.cost, cost_area)
	else:
		initialize_number_icon("cost", card.cost, cost_area)
		
	initialize_number_icon("score", card.score, score_area)
	initialize_number_icon("skill", card.skill, icon_area)
	initialize_icon("boot", card.boots, icon_area)
	initialize_icon("sword", card.swords, icon_area)
	
		
func initialize_number_icon(name, amount, area) -> void:
	if amount > 0:
		var icon = CARD_ICON.instantiate()
		icon.set_icon(name, amount)
		area.add_child(icon)

func initialize_icon(name, amount, area) -> void:
	for i in amount:
		var icon := CARD_ICON.instantiate()
		icon.set_icon(name, 0)
		area.add_child(icon)

func set_color():
	match card.type:
		Card.Type.RESERVE:
			card_color.color = Color.DARK_GOLDENROD
		Card.Type.MONSTER:
			card_color.color = Color.RED
		Card.Type.STARTING:
			card_color.color = Color.GRAY
		Card.Type.EVENT:
			card_color.color = Color.PURPLE
		Card.Type.DUNGEON:
			card_color.color = Color.BLUE
