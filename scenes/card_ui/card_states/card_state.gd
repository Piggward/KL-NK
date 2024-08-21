class_name CardState
extends Node

enum State { BASE, CLICKED, DRAGGING, RELEASED }


signal transition_requested(from: CardState, to: State)

@export var state: State

var card_ui: CardUI

func enter() -> void:
	pass

func exit() -> void:
	pass

func on_input(_event: InputEvent) -> void:
	pass

func on_gui_input(_event: InputEvent) -> void:
	pass


func on_mouse_entered() -> void:
	pass # Replace with function body.


func on_mouse_exited() -> void:
	pass # Replace with function body.
	

func on_drop_point_detector_area_entered(area: Area2D) -> void:
	pass
