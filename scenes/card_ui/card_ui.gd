class_name CardUI
extends Control

@onready var color = $Color
@onready var state = $State
@onready var card_state_machine = $CardStateMachine as CardStateMachine


# Called when the node enters the scene tree for the first time.
func _ready():
	card_state_machine.init(self)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_mouse_entered():
	card_state_machine.on_mouse_entered()

func _on_mouse_exited():
	card_state_machine.on_mouse_exited()


func _on_gui_input(event) -> void:
	card_state_machine.on_gui_input(event)


