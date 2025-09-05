extends Node2D

@onready var dialogue_box: Control = $"CanvasLayer/DialogueBox"

func _ready() -> void:
	AudioManager.play_bgm("leitmotif")
	DialogueManager.register_dialogue_box(dialogue_box)
	DialogueManager.dialogue_finished.connect(_on_dialogue_finished)
	DialogueManager.present_lines([
		"Mẹ nói chúng ta sắp chuyển nhà...",
		"Nhưng đây là căn nhà em yêu nhất!",
		"Nếu đây là cuộc phiêu lưu, em sẽ cần một bản đồ kho báu!"
	])

func _on_dialogue_finished() -> void:
	PuzzleManager.start_puzzle("res://puzzles/StubTreasureMap.tscn", self)
