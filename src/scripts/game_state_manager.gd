extends Node

@onready var jugador: Jugador = $"../jugador" as Jugador
@onready var metas_manager: Node = $"../metas_manager" as MetasManager

#func _ready() -> void:
	#metas_manager.todas_las_metas_ocupadas.connect()

func matar_jugador():
	print("Muerte Jugador")
	jugador.muere()
