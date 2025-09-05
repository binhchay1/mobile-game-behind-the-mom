extends Control

signal next_pressed

@onready var label_node: Label = $"Panel/MarginContainer/VBox/Label"
@onready var next_btn: Button = $"Panel/MarginContainer/VBox/NextButton"

func _ready() -> void:
	next_btn.pressed.connect(func(): emit_signal("next_pressed"))

func set_text(t: String) -> void:
	label_node.text = t
