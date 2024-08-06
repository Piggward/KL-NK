class_name TileUI
extends Control

@onready var color: ColorRect = $Color
@onready var tile_state_machine: TileStateMachine = $TileStateMachine as TileStateMachine

func _ready() -> void:
	tile_state_machine.init(self)

func _on_gui_input(event: InputEvent) -> void:
	tile_state_machine.on_gui_input(event)
	
func _on_mouse_entered() -> void:
	tile_state_machine.on_mouse_entered()
	
func _on_mouse_exited() -> void:
	tile_state_machine.on_mouse_exited()

func _on_click_area_mouse_entered():
	pass # Replace with function body.
