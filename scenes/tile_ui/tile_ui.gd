class_name TileUI
extends Control

@onready var color: ColorRect = $Color
@onready var tile_state_machine: TileStateMachine = $TileStateMachine as TileStateMachine
@onready var exit_roads: Array

func _ready() -> void:
	tile_state_machine.init(self)

func _on_gui_input(event: InputEvent) -> void:
	tile_state_machine.on_gui_input(event)

func _on_click_area_mouse_entered():
	pass # Replace with function body.
	
func update_available_neighbouring_tiles(current_boots: int = 1) -> Array: # TileUI[]
	if current_boots <= 0:
		return []
	
	# Current tile ID
	var current_tile_id = MapController.players[TurnManager.activePlayer.get_instance_id()].pos
	print("\ncurrent_tile: %s ] update_available_neighbouring_tiles %s < -> %s" % [current_tile_id, name, current_boots])

	var tiles = []
	for road in exit_roads:
		var tile = road.end_tile
		#if tile.get_instance_id() == current_tile_id:
			#continue
		if road.two_way && tile == self:
			tile = road.start_tile
		
		var tile_state = tile.tile_state_machine.current_state
		tile_state.transition_requested.emit(tile_state, TileState.State.AVAILABLE)
		tiles.append(tile)
		tiles += tile.update_available_neighbouring_tiles(current_boots - 1)
	return tiles
