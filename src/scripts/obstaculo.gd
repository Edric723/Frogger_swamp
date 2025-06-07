extends Area2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	if sprite.sprite_frames.has_animation("water_moving"):
		sprite.play("water_moving")
	else:
		print("El recurso sprite_frames no tiene la animación 'water_moving'")
