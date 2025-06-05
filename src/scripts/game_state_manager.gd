extends Node

@onready var jugador: Jugador = $"../jugador" as Jugador
@onready var metas_manager: Node = $"../metas_manager" as MetasManager
@onready var hud: CanvasLayer = $"../hud"


func _ready() -> void:
	metas_manager.todas_las_metas_ocupadas.connect(on_todas_las_metas_ocupada)
	metas_manager.meta_ocupada.connect(on_meta_ocupada)
	jugador.vida_perdida.connect(on_vida_perdida)
	jugador.game_over.connect(on_game_over)
	hud.crear_vidas(jugador.vidas)


func on_meta_ocupada():
	print("{on_meta_ocupada}")
	jugador.resetear_jugador()


func on_todas_las_metas_ocupada():
	print("GANASTE EL JUEGO!!!")
	jugador.set_process_input(false)
	jugador.animated_sprite_2d.self_modulate = Color (1, 0.4, 0)
	hud.mostrar_victoria()


func on_vida_perdida():
	hud.perder_vidas()


func on_game_over():
	hud.mostrar_derrota()


func matar_jugador():
	print("Muerte Jugador")
	jugador.muere()
