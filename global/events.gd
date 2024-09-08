extends Node

signal card_played(card: Card)
signal card_purchased(card: Card)
signal card_removed(card: Card)
signal turn_ended(card: Card)

# TileUI
signal tiles_reset_all()
