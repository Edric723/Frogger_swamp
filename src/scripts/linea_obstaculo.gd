extends Node2D

class_name LineaObstaculo

signal jugador_golpeado

@onready var escena_obstaculo: PackedScene = preload("res://src/scenes/obstaculo.tscn")

@export var contador_obstaculos = 3
@export var distancia_entre_obstaculos = 128
@export var velocidad = 200
@export var limite_movimiento_x = 512

var obstaculos = []

func _ready() -> void:
	for i in contador_obstaculos:
		var obstaculo = escena_obstaculo.instantiate()
		obstaculo.position = Vector2(limite_movimiento_x + distancia_entre_obstaculos * i, 0)
		obstaculo.area_entered.connect(on_jugador_entra_obstaculo)
		add_child(obstaculo)
		obstaculos.append(obstaculo)

func _process(delta: float) -> void:
	for obstaculo in obstaculos:
		var nueva_posicion_x = obstaculo.position.x - velocidad * delta
		if nueva_posicion_x < -limite_movimiento_x:
			obstaculo.position.x = limite_movimiento_x
		else:
			obstaculo.position.x = nueva_posicion_x

func on_jugador_entra_obstaculo(area: Area2D):
	emit_signal("jugador_golpeado")

	print("Auch")
	if area is Jugador:
		jugador_golpeado.emit()
