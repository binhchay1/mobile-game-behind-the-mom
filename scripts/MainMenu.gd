extends Control

@onready var btn_an: Button = $"MarginContainer/VBoxContainer/BtnAn"
@onready var btn_mai: Button = $"MarginContainer/VBoxContainer/BtnMai"
@onready var btn_quit: Button = $"MarginContainer/VBoxContainer/BtnQuit"

func _ready() -> void:
	btn_an.pressed.connect(_on_start_an)
	btn_mai.pressed.connect(_on_start_mai)
	btn_quit.pressed.connect(_on_quit)

func _on_start_an() -> void:
	GameState.set_route("an")
	get_tree().change_scene_to_file("res://scenes/Chapter1_An.tscn")

func _on_start_mai() -> void:
	GameState.set_route("mai")
	get_tree().change_scene_to_file("res://scenes/Chapter1_Mai.tscn")

func _on_quit() -> void:
	get_tree().quit()
