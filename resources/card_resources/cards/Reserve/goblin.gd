extends Card

func apply_effects():
	print("player gets 1 gold!")
	TurnManager.activePlayer.gold += 1
