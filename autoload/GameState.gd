extends Node

signal game_saved

var save_path: String = "user://savegame.json"

var current_route: String = ""
var progress_by_route: Dictionary = {"an": 1, "mai": 1}
var collected_memory_item_ids: Array[String] = []

func _ready() -> void:
	load_game()

func set_route(route: String) -> void:
	current_route = route
	save_game()

func get_route() -> String:
	return current_route

func set_chapter_progress(route: String, chapter: int) -> void:
	progress_by_route[route] = chapter
	save_game()

func collect_memory_item(item_id: String) -> void:
	if not collected_memory_item_ids.has(item_id):
		collected_memory_item_ids.append(item_id)
		save_game()

func to_dict() -> Dictionary:
	return {
		"current_route": current_route,
		"progress_by_route": progress_by_route,
		"collected_memory_item_ids": collected_memory_item_ids
	}

func from_dict(d: Dictionary) -> void:
	current_route = String(d.get("current_route", ""))
	progress_by_route = d.get("progress_by_route", {"an": 1, "mai": 1})
	collected_memory_item_ids = d.get("collected_memory_item_ids", [])

func save_game() -> void:
	var file := FileAccess.open(save_path, FileAccess.WRITE)
	if file:
		var json := JSON.stringify(to_dict())
		file.store_string(json)
		file.close()
		emit_signal("game_saved")

func load_game() -> void:
	if not FileAccess.file_exists(save_path):
		return
	var file := FileAccess.open(save_path, FileAccess.READ)
	if file:
		var text := file.get_as_text()
		file.close()
		var result := JSON.new()
		var error := result.parse(text)
		if error == OK:
			var d := result.get_data()
			if typeof(d) == TYPE_DICTIONARY:
				from_dict(d)
