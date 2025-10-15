extends Node

signal dialogue_finished

var dialogue_box: Control = null
var _lines: PackedStringArray = []
var _index: int = 0

func register_dialogue_box(box: Control) -> void:
	dialogue_box = box
	if not dialogue_box.is_connected("next_pressed", Callable(self, "_on_box_next")):
		dialogue_box.connect("next_pressed", Callable(self, "_on_box_next"))

func present_lines(lines: PackedStringArray) -> void:
	_lines = lines
	_index = 0
	_show_current()

func _show_current() -> void:
	if dialogue_box == null:
		push_warning("DialogueBox not registered")
		return
	dialogue_box.visible = true
	if _index >= 0 and _index < _lines.size():
		dialogue_box.call("set_text", _lines[_index])
	else:
		dialogue_box.visible = false
		_lines = []
		emit_signal("dialogue_finished")

func _on_box_next() -> void:
	_index += 1
	_show_current()
