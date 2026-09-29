class_name Mob
extends RigidBody2D

var type: MobType

## A appeler entre instantiate() et add_child().
func setup(p_type: MobType) -> void:
	type = p_type
	$AnimatedSprite2D.sprite_frames = type.sprite_frames
	assert(not type.animations.is_empty(), "MobType sans animation : %s" % type.display_name)
	# Le tirage est ecrit sur CE mob (son AnimatedSprite2D), jamais sur le type :
	# type.animations est partage par tous les mobs de ce type.
	$AnimatedSprite2D.animation = type.animations.pick_random()
	$AnimatedSprite2D.play()

func _ready() -> void:
	assert(type != null, "setup() doit etre appele avant add_child()")

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
