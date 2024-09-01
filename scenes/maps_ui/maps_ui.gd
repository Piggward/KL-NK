extends Node

@onready var start_tile = $StartTile as TileUI

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set players startloc
	MapController.start_tile = start_tile
