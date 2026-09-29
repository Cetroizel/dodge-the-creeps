extends Node

const KEY_HIGH_SCORE: String = "high_score"
var high_score: int = 0

func _ready() -> void:
	load_score()

func update_high_score(score: int) -> void:
	if score > high_score:
		high_score = score
		save_score()

func save_score() -> void:
	var data: Dictionary = {KEY_HIGH_SCORE: high_score}
	var file: FileAccess = FileAccess.open("user://highscore.save", FileAccess.WRITE)
	file.store_string(JSON.stringify(data))
	file.close()

func load_score() -> void:
	if FileAccess.file_exists("user://highscore.save"):
		var file: FileAccess = FileAccess.open("user://highscore.save", FileAccess.READ)
		var json_string: String = file.get_as_text()
		file.close()
		var data: Variant = JSON.parse_string(json_string)
		if data is Dictionary:
			high_score = int(data.get(KEY_HIGH_SCORE, 0))
