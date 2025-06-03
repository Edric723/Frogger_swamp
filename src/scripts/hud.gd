extends CanvasLayer

class_name Hud

@onready var vidas: HBoxContainer = %vidas
@onready var center_container: CenterContainer = $MarginContainer/CenterContainer
@onready var panel_container: PanelContainer = $MarginContainer/CenterContainer/PanelContainer
@onready var resultado: Label = $MarginContainer/CenterContainer/PanelContainer/VBoxContainer/resultado
@onready var fondo_vidas: ColorRect = $MarginContainer/HBoxContainer/fondo_vidas



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


#func perder_vidas():
	#var _textura_vida = textura_vidas.pop_back()
	#_textura_vida.queue_free()

func perder_vidas():
	## Utilizo size xq es un array
	if textura_vidas.size() > 0:
		var textura_vida_activa = textura_vidas.pop_back()
		## No utilizo queue_free porque cambió el display de la flexbox.
		textura_vida_activa.texture = textura_vida_off


func mostrar_victoria():
	resultado.text = "Válido para un aprobado!"
	center_container.show()


func mostrar_derrota():
	#resultado.text = ""
	center_container.show()


func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
