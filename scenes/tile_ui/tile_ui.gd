class_name TileUI
extends Control

@onready var color: ColorRect = $Color
@onready var tile_state_machine: TileStateMachine = $TileStateMachine as TileStateMachine
@onready var exit_roads: Array

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
	
func available_neighbouring_tiles(stamina: int = 1) -> Array: # TileUI[]
	var tiles = []
	for road in exit_roads:
		var tile = road.end_tile
		if road.two_way && tile == self:
			tile = road.start_tile
		
		var tile_state = tile.tile_state_machine.current_state
		tile_state.transition_requested.emit(tile_state, TileState.State.FOCUSED)	
		#print(tile_state_machine.current_state)
		tiles.append(tile)
		#print("%s leads to %s" % [road.name, tile.name])
	return tiles

