extends Node

var bgm_player: AudioStreamPlayer
var sfx_player: AudioStreamPlayer

var bgm_library: Dictionary = {
	"leitmotif": "res://assets/audio/leitmotif.ogg"
}

var sfx_library: Dictionary = {}

func _ready() -> void:
	bgm_player = AudioStreamPlayer.new()
	bgm_player.name = "BGMPlayer"
	add_child(bgm_player)
	bgm_player.bus = "Master"

	sfx_player = AudioStreamPlayer.new()
	sfx_player.name = "SFXPlayer"
	add_child(sfx_player)
	sfx_player.bus = "Master"

func play_bgm(key: String, volume_db: float = -8.0) -> void:
	var path := String(bgm_library.get(key, ""))
	if path == "":
		push_warning("BGM not found: " + key)
		return
	var stream := load(path)
	if stream == null:
		push_warning("BGM stream missing at " + path)
		return
	bgm_player.stop()
	bgm_player.stream = stream
	bgm_player.volume_db = volume_db
	bgm_player.play()

func stop_bgm() -> void:
	if bgm_player:
		bgm_player.stop()

func set_bgm_volume_db(db: float) -> void:
	if bgm_player:
		bgm_player.volume_db = db

func play_sfx(key: String, volume_db: float = 0.0) -> void:
	var path := String(sfx_library.get(key, ""))
	if path == "":
		push_warning("SFX not found: " + key)
		return
	var stream := load(path)
	if stream == null:
		push_warning("SFX stream missing at " + path)
		return
	sfx_player.stream = stream
	sfx_player.volume_db = volume_db
	sfx_player.play()
