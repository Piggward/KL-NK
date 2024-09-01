extends Control

@onready var clanks:= {};
const Clank = preload("res://resources/clank/clank.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.end_turn.connect(_on_turn_ended)
	Events.add_clank.connect(add_clank)
	pass # Replace with function body.

func add_clank(player: Player.PlayerColor, amount: int):
	var clank := Clank.new()
	clank.player_color = player
	
	if not clanks.find_key(player):
		clanks[player] = amount
	else:
		clanks[player] += amount
	
func _on_turn_ended():
	for key in clanks:
		clanks[key] = clanks[key] if clanks[key] > 0 else 0
			
