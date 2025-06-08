extends Area2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	randomize()
	if sprite.sprite_frames.has_animation("water_moving"):
		sprite.play("water_moving")
		# Aleatorizo el frame para evitar la sincronía de la animación entre obstáculos.
		sprite.frame = randi() % sprite.sprite_frames.get_frame_count("water_moving")
	else:
		print("El recurso sprite_frames no tiene la animación 'water_moving'")
