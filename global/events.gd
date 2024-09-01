extends Node

signal card_played(card: Card)
signal card_purchased(card: Card)
signal card_removed(card: Card)
signal try_end_turn()
signal end_turn()
signal try_start_game()
signal start_game()

signal tiles_reset_all(sender: TileUI)
