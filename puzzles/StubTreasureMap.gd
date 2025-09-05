extends Control

signal puzzle_completed

@onready var complete_btn: Button = $"Panel/MarginContainer/VBox/Complete"

func _ready() -> void:
	complete_btn.pressed.connect(func(): emit_signal("puzzle_completed"))
