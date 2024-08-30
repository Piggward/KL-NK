class_name CardIconNumber
extends Control

const SWORD_ICON = preload("res://Art/Clank!/sword-icon.png")
const SKILL_ICON = preload("res://Art/Clank!/skill-icon.png")
const SCORE_ICON = preload("res://Art/Clank!/score-icon.png")
const BOOT_ICON = preload("res://Art/Clank!/boot-icon.png")
const COST_ICON = preload("res://Art/Clank!/cost-icon.png")

func set_icon(icon: String, number: int) -> void:
	var shape = get_node("Shape")
	var amount = get_node("Amount")
	match icon:
		"skill":
			amount.text = str(number)
			shape.texture = SKILL_ICON 
		"score":
			amount.text = str(number)
			amount.add_theme_color_override("font_color", Color.WHITE)
			shape.texture = SCORE_ICON
		"sword":
			self.remove_child(amount)
			shape.texture = SWORD_ICON
		"boot":
			self.remove_child(amount)
			shape.texture = BOOT_ICON
		"cost":
			amount.text = str(number)
			amount.global_position += Vector2(4, 4)
			amount.add_theme_color_override("font_color", Color.WHITE)
			shape.texture = COST_ICON
			

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
