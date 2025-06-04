extends Area2D

class_name Meta

signal entro_meta


@onready var meta_obtenida_sprite: Sprite2D = $meta_obtenida_sprite
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


func _on_area_entered(area: Area2D) -> void:
	if area is Jugador:
		entro_meta.emit()
		meta_obtenida_sprite.show()
		collision_shape_2d.set_deferred("disabled", false)
