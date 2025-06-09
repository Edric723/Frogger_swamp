extends CanvasLayer

class_name Hud

@onready var vidas: HBoxContainer = %vidas
@onready var resultado: Label = $Panel_Resultado/MarginContainer/GridContainer/resultado
@onready var panel_resultado: PanelContainer = $Panel_Resultado


## Variables
var textura_vida = preload("res://_assets/vidas.png")
var textura_vida_off = preload("res://_assets/vida_off.png")
var textura_vidas: Array[TextureRect] = []


func crear_vidas(cantidad_vidas: int):
	for vida in cantidad_vidas:
		var texture_rect = TextureRect.new()
		texture_rect.custom_minimum_size = Vector2(16,16)
		texture_rect.texture = textura_vida
		texture_rect.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		vidas.add_child(texture_rect)
		textura_vidas.append(texture_rect)


func perder_vidas():
	## Utilizo size xq es un array
	if textura_vidas.size() > 0:
		var textura_vida_activa = textura_vidas.pop_back()
		## No utilizo queue_free porque modificaría el display de la flexbox.
		textura_vida_activa.texture = textura_vida_off


func mostrar_victoria():
	resultado.text = "¡Ganaste! \nVálido para un aprobado"
	panel_resultado.show()


func mostrar_derrota():
	resultado.text = "Hoy has perdido chicx,\npero no tiene por qué gustarte..."
	panel_resultado.show()


func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
