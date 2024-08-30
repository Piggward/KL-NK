extends CardState


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func enter():
	card_ui.glow_panel.set("theme_override_styles/panel", card_ui.EMPTY_STYLE)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
