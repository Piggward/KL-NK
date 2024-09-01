extends Card

func apply_effects():
	Events.add_clank.emit(TurnManager.activePlayer.player_color, 1)

