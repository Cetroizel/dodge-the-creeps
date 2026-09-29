extends Node

@export var spawner: MobSpawner
var score: int

func _ready() -> void:
	assert(spawner != null, "brancher le noeud MobSpawner dans l'inspecteur de Main")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func game_over() -> void:
	GameState.update_high_score(score)
	$HUD.show_game_over()
	$ScoreTimer.stop()
	$MobTimer.stop()
	$Music.stop()
	$DeathSound.play()

func new_game() -> void:
	get_tree().call_group("mobs", "queue_free")
	score = 0
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$Music.play()

func _on_mob_timer_timeout() -> void:
	var spawn_location: PathFollow2D = $MobPath/MobSpawnLocation
	spawner.spawn_at(spawn_location)

func _on_score_timer_timeout() -> void:
	score += 1
	$HUD.update_score(score)

func _on_start_timer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()
