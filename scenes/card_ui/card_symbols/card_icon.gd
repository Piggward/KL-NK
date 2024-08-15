class_name CardIcon
extends Control

const BOOT_ICON = preload("res://Art/Clank!/Boot-Icon.png")
const SWORD_ICON = preload("res://Art/Clank!/sword-icon.png")
const SKILL_ICON = preload("res://Art/Clank!/skill-icon.png")

func set_icon(icon: String) -> void:
	var texture_rect = get_node("TextureRect")
	match icon:
		"boot":
			texture_rect.texture = BOOT_ICON 
		"sword":
			texture_rect.texture = SWORD_ICON 
		"skill":
			texture_rect.texture = SKILL_ICON 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_gui_input(event):
	var card_ui = get_tree().get_first_node_in_group("card_ui")
	card_ui._on_gui_input(event)
	pass # Replace with function body.
