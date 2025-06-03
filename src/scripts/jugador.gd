extends Area2D

class_name Jugador

signal vida_perdida
signal  game_over

const INCREMENTO_POSICION = 16
const POSICION_INICIAL_JUGADOR = Vector2(16.0 , 16.0)

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var timer: Timer = $Timer

@export var velocidad = 25
@export var vidas = 3

var nueva_posicion : Vector2 = Vector2.ZERO

# para que arranque de frente por default, ya animado.
func _ready() -> void:
		animated_sprite_2d.play("idle_forward")
		timer.timeout.connect(on_timer_timeout)
		

func on_timer_timeout ():
	print("Perdió vida")
	vidas -= 1
	vida_perdida.emit()
	print("Vidas restantes = ", vidas )

	if vidas == 0:
		print("Game-Over")
		set_process_input(false)
		game_over.emit()	
	else:
		resetear_jugador()	


# DELTA
func _process(delta: float) -> void:
	if nueva_posicion == Vector2.ZERO:
		return

	position = lerp(position, nueva_posicion, velocidad * delta)

	if position.distance_to(nueva_posicion) < 0.5:
		position = nueva_posicion
		nueva_posicion = Vector2.ZERO

# INPUTS
func _input(event: InputEvent) -> void:
	var posicion_modificada

	if nueva_posicion != Vector2.ZERO:
		return

	if event.is_action_pressed("up"):
		posicion_modificada = position + Vector2.UP * INCREMENTO_POSICION
		animated_sprite_2d.play("idle_backward")	
	elif event.is_action_pressed("down"):
		posicion_modificada = position + Vector2.DOWN * INCREMENTO_POSICION
		animated_sprite_2d.play("idle_forward")	
	elif event.is_action_pressed("right"):
		posicion_modificada = position + Vector2.RIGHT * INCREMENTO_POSICION
		animated_sprite_2d.play("idle_side")
		animated_sprite_2d.set_flip_h(false)	
	elif event.is_action_pressed("left"):
		posicion_modificada = position + Vector2.LEFT * INCREMENTO_POSICION
		animated_sprite_2d.set_flip_h(true)
		animated_sprite_2d.play("idle_side")	

	if posicion_modificada:
		mover_jugador(posicion_modificada)

# MOVER AL JUGADOR	
func mover_jugador(posicion_modificada: Vector2) -> void:
		var tile_offset = 8
		var viewport_size = get_viewport_rect().size

		var minimo_x = tile_offset
		var maximo_x = viewport_size.x - tile_offset

		var minimo_y = tile_offset
		var maximo_y  = viewport_size.y - tile_offset

		var posicion_clampeada = Vector2 (
			clamp(posicion_modificada.x, minimo_x, maximo_x),
			clamp(posicion_modificada.y, minimo_y, maximo_y)
		)

		nueva_posicion = posicion_clampeada

func muere() :
	collision_shape_2d.set_deferred("disabled", true)
	animated_sprite_2d.self_modulate = Color(1, 0, 0)
	#animated_sprite_2d.play("hit")
	set_process_input(false)
	timer.start()

func resetear_jugador() :
	set_process_input(true)
	collision_shape_2d.set_deferred("disabled", false)
	animated_sprite_2d.self_modulate = Color(1, 1, 1)
	animated_sprite_2d.play("idle_forward")
	global_position = POSICION_INICIAL_JUGADOR
	nueva_posicion = POSICION_INICIAL_JUGADOR
