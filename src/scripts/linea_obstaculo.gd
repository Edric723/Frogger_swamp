extends Node2D

class_name LineaObstaculo

signal jugador_golpeado

@onready var escena_obstaculo: PackedScene = preload("res://src/scenes/obstaculo.tscn")


@export var contador_obstaculos : int
@export var distancia_entre_obstaculos : int
@export var velocidad : int
@export var limite_movimiento_x : float #Borde derecho


var obstaculos = []

func _ready() -> void:
	for i in contador_obstaculos:
		var obstaculo = escena_obstaculo.instantiate()
		# Acá le doy el valor del borde, xq si lo hago directo en el export siempre es 0 x no tener el arbol de nodos cargado.
		limite_movimiento_x = get_viewport_rect().size.x + 16
		obstaculo.position = Vector2(limite_movimiento_x - distancia_entre_obstaculos * i, 0) # Les digo desde qué X quiero que  inicien.
		obstaculo.area_entered.connect(on_jugador_entra_obstaculo)
		add_child(obstaculo)
		obstaculos.append(obstaculo)


func _process(delta: float) -> void:
	for obstaculo in obstaculos:
		var nueva_posicion_x = obstaculo.position.x - velocidad * delta
		# 16 x el ancho del sprite y 0 x ser el borde izquierdo de X
		if nueva_posicion_x + 16 < 0: 
			nueva_posicion_x = limite_movimiento_x + distancia_entre_obstaculos * (contador_obstaculos - 1)
		obstaculo.position.x = nueva_posicion_x


func on_jugador_entra_obstaculo(area: Area2D):
	if area is Jugador:
		print("Auch")
		jugador_golpeado.emit()
