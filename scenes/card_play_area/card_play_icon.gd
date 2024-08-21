extends Control
@onready var texture_rect = $Control/TextureRect
@export var texture: Texture

# Called when the node enters the scene tree for the first time.
func _ready():
	texture_rect.texture = texture
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
