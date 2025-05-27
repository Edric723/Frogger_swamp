extends Area2D

class_name Meta

signal entro_meta

@onready var obtenida: Sprite2D = $obtenida





func _on_area_entered(area: Area2D) -> void:
	if area is Jugador:
		entro_meta.emit()
		obtenida.show() # Replace with function body.
