extends Node

@onready var start_tile = $StartTile as TileUI

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set players startloc
	print("pls no")
	MapController.set_start_tile(start_tile.get_instance_id())
