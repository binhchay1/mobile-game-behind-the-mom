extends Node2D

@onready var dialogue_box: Control = $"CanvasLayer/DialogueBox"

func _ready() -> void:
	AudioManager.play_bgm("leitmotif")
	DialogueManager.register_dialogue_box(dialogue_box)
	DialogueManager.present_lines([
		"Lại một cuộc gọi đòi nợ...",
		"An không thể biết chuyện này.",
		"Mình phải giấu bức thư và kể với con về chuyến phiêu lưu mới."
	])
