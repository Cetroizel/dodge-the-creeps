class_name MobSpawner
extends Node
## Factory : assemble un Mob complet a partir d'un MobType tire au hasard, et
## l'ajoute LUI-MEME a l'arbre. L'appelant ne sait pas si le mob est neuf ou
## recycle : c'est ce qui permettra le pool de l'etape 6.1 sans toucher main.gd.

@export var mob_scene: PackedScene
@export var available_types: Array[MobType] = []

func _ready() -> void:
	assert(mob_scene != null, "renseigner mob_scene dans l'inspecteur de MobSpawner")
	assert(not available_types.is_empty(), "renseigner available_types dans l'inspecteur de MobSpawner")

func spawn_at(spawn_point: PathFollow2D) -> Mob:
	var type: MobType = available_types.pick_random()
	var mob: Mob = mob_scene.instantiate() as Mob
	mob.setup(type)

	# Position au hasard sur le chemin, direction perpendiculaire a celui-ci
	# avec un peu de hasard, vitesse tiree dans la plage du type.
	spawn_point.progress_ratio = randf()
	mob.position = spawn_point.position
	var direction: float = spawn_point.rotation + PI / 2 + randf_range(-PI / 4, PI / 4)
	mob.rotation = direction
	var speed: float = randf_range(type.speed_min, type.speed_max)
	mob.linear_velocity = Vector2(speed, 0.0).rotated(direction)

	add_child(mob)
	return mob
