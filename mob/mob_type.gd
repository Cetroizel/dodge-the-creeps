class_name MobType
extends Resource
## Donnee de reference d'un type de mob, partagee par toutes ses instances
## (Flyweight). Un mob la LIT, il n'y ecrit jamais : une ecriture modifierait
## tous les mobs du meme type tant que le jeu tourne.

@export var display_name: String = ""
@export var sprite_frames: SpriteFrames
## Une seule entree : animation fixe. Plusieurs : tiree au hasard a chaque spawn.
@export var animations: Array[StringName] = [&"walk"]
@export_range(50.0, 600.0) var speed_min: float = 150.0
@export_range(50.0, 600.0) var speed_max: float = 250.0
@export var score_value: int = 1
