extends Node

class_name MetasManager


signal todas_las_metas_ocupadas
signal meta_ocupada

var contador_metas = 0
var metas_ocupadas = 0

func _ready() -> void:
	var metas = get_children() as Array[Meta]
	contador_metas = metas.size()

	for meta in metas:
		meta.entro_meta.connect(on_jugador_entro_meta)

func on_jugador_entro_meta():
	print("Un jugador entró a la meta")
	metas_ocupadas += 1
	meta_ocupada.emit()

	if metas_ocupadas == contador_metas:
		print("Metas ocupadas = " , metas_ocupadas)
		todas_las_metas_ocupadas.emit()
