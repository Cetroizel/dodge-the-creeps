extends Node

const KEY_HIGH_SCORE = "high_score"
var high_score: int = 0

func _ready():
	load_score()

func update_high_score(score):
	if score > high_score:
		high_score = score
		save_score()

func save_score():
	var data = {KEY_HIGH_SCORE: high_score}
	var file = FileAccess.open("user://highscore.save", FileAccess.WRITE)
	file.store_string(JSON.stringify(data))
	file.close()

func load_score():
	if FileAccess.file_exists("user://highscore.save"):
		var file = FileAccess.open("user://highscore.save", FileAccess.READ)
		var json_string = file.get_as_text()
		file.close()
		var data = JSON.parse_string(json_string)
		if data is Dictionary:
			high_score = int(data.get(KEY_HIGH_SCORE, 0))
