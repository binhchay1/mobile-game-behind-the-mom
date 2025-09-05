extends Node

signal puzzle_opened(scene_path: String)
signal puzzle_closed(scene_path: String)

var active_puzzle: Node = null
var active_scene_path: String = ""

func start_puzzle(scene_path: String, parent: Node = null) -> void:
	if active_puzzle != null:
		return
	var packed := load(scene_path)
	if packed == null:
		push_warning("Puzzle scene not found: " + scene_path)
		return
	var instance := packed.instantiate()
	active_puzzle = instance
	active_scene_path = scene_path
	var target_parent := parent if parent != null else get_tree().current_scene
	target_parent.add_child(instance)
	if instance.has_signal("puzzle_completed"):
		instance.connect("puzzle_completed", Callable(self, "_on_puzzle_completed"))
	emit_signal("puzzle_opened", scene_path)

func _on_puzzle_completed() -> void:
	var path := active_scene_path
	if active_puzzle and is_instance_valid(active_puzzle):
		active_puzzle.queue_free()
	active_puzzle = null
	active_scene_path = ""
	emit_signal("puzzle_closed", path)
