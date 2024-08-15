class_name CardIconNumber
extends Control

const SWORD_ICON = preload("res://Art/Clank!/sword-icon.png")
const SKILL_ICON = preload("res://Art/Clank!/skill-icon.png")
const SCORE_ICON = preload("res://Art/Clank!/Score-Icon.png")
const BOOT_ICON = preload("res://Art/Clank!/Boot-Icon.png")

func set_icon(icon: String, number: int) -> void:
	var shape = get_node("Shape")
	var amount = get_node("Amount")
	match icon:
		"skill":
			amount.text = str(number)
			shape.texture = SKILL_ICON 
		"score":
			amount.text = str(number)
			shape.texture = SCORE_ICON
		"sword":
			self.remove_child(amount)
			shape.texture = SWORD_ICON
		"boot":
			self.remove_child(amount)
			shape.texture = BOOT_ICON

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_gui_input(event):
	#looking for a better way to do this
	get_parent().get_parent().get_parent()._on_gui_input(event)
	pass # Replace with function body.
