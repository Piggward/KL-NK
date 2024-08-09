class_name CardUI
extends Control

signal reparent_requested(which_card_ui: CardUI)
@onready var color = $Color
@onready var state = $State
@onready var card_state_machine = $CardStateMachine as CardStateMachine

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


func _on_gui_input(event) -> void:
	card_state_machine.on_gui_input(event)


