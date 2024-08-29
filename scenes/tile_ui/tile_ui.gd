class_name TileUI
extends Control

@onready var color: ColorRect = $Color
@onready var tile_state_machine: TileStateMachine = $TileStateMachine as TileStateMachine
@onready var exit_roads: Array

func _ready() -> void:
	tile_state_machine.init(self)

func _on_gui_input(event: InputEvent) -> void:
	tile_state_machine.on_gui_input(event)
	
#func _on_mouse_entered() -> void:
	#tile_state_machine.on_mouse_entered()
	#
#func _on_mouse_exited() -> void:
	#tile_state_machine.on_mouse_exited()

func _on_click_area_mouse_entered():
	pass # Replace with function body.
	
func update_available_neighbouring_tiles(stamina: int = 1) -> Array: # TileUI[]
	# Reset all tiles TODO: make this prettier! Maybe a queue-based input system (not related to this lol but still)
	for tile in get_tree().get_nodes_in_group("tiles"):
		var state = tile.tile_state_machine.current_state
		state.transition_requested.emit(state, TileState.State.IDLE)

	var tiles = []
	for road in exit_roads:
		var tile = road.end_tile
		if road.two_way && tile == self:
			tile = road.start_tile
		
		var tile_state = tile.tile_state_machine.current_state
		tile_state.transition_requested.emit(tile_state, TileState.State.AVAILABLE)
		tiles.append(tile)
	return tiles
