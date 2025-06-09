extends Node2D

class_name LineaObstaculo

signal jugador_golpeado

@onready var escena_obstaculo: PackedScene = preload("res://src/scenes/obstaculo.tscn")

@export var contador_obstaculos : int
@export var distancia_entre_obstaculos : int
@export var velocidad : int
#@export var limite_movimiento_x : float # Borde derecho relativo al nodo
# Uso position.x xq me interesa que el desplazamiento se adapte a donde ubique el nodo.
var obstaculos = []

func _ready() -> void:
	for i in contador_obstaculos:
		var obstaculo = escena_obstaculo.instantiate()
		# Aparece hacia la derecha de la posición del nodo para evitar solapación.
		obstaculo.position = Vector2(distancia_entre_obstaculos * i, 0)
		obstaculo.area_entered.connect(on_jugador_entra_obstaculo)
		add_child(obstaculo)
		obstaculos.append(obstaculo)


func _process(delta: float) -> void:
	for obstaculo in obstaculos:
		# Mover hacia la izquierda
		var nueva_posicion_x = obstaculo.position.x - velocidad * delta
		# Si salió completamente por el borde izquierdo (relativo al nodo).
		if nueva_posicion_x + 16 < -position.x:
			# Lo reseteamos.
			nueva_posicion_x = distancia_entre_obstaculos * (contador_obstaculos - 1)

		obstaculo.position.x = nueva_posicion_x


func on_jugador_entra_obstaculo(area: Area2D) -> void:
	if area is Jugador:
		print("Auch")
		jugador_golpeado.emit()
