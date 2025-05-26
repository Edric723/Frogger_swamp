extends Area2D

class_name Jugador

const INCREMENTO_POSICION = 16

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var velocidad = 25


var nueva_posicion : Vector2 = Vector2.ZERO

# para que arranque de frente por default, ya animado.
func _ready() -> void:
		animated_sprite_2d.play("idle_forward")
	

# DELTA
func _process(delta: float) -> void:
	if nueva_posicion == Vector2.ZERO:
		return

	position = lerp(position, nueva_posicion, velocidad * delta)
	
	if position.distance_to(nueva_posicion) < 0.5:
		position = nueva_posicion
		nueva_posicion = Vector2.ZERO
		#control_animation_idle();


# INPUTS
func _input(event: InputEvent) -> void:
	var posicion_modificada
	
	if nueva_posicion != Vector2.ZERO:
		return
	#Falta implementa el idle de espaldas en el up
	
	if event.is_action_pressed("up"):
		posicion_modificada = position + Vector2.UP * INCREMENTO_POSICION
		animated_sprite_2d.play("idle_backward")	
	elif event.is_action_pressed("down"):
		posicion_modificada = position + Vector2.DOWN * INCREMENTO_POSICION
		animated_sprite_2d.play("idle_forward")	
	elif event.is_action_pressed("right"):
		posicion_modificada = position + Vector2.RIGHT * INCREMENTO_POSICION
		animated_sprite_2d.play("moving")
		animated_sprite_2d.set_flip_h(false)	
	elif event.is_action_pressed("left"):
		posicion_modificada = position + Vector2.LEFT * INCREMENTO_POSICION
		animated_sprite_2d.set_flip_h(true)
		animated_sprite_2d.play("moving")	
	
	if posicion_modificada:
		mover_jugador(posicion_modificada)
		
#func control_animation_idle() -> void:
	#match animated_sprite_2d.animation:
		#"up":
			#animated_sprite_2d.play("idle_backward")
		#"down":
			#animated_sprite_2d.play("idle_forward")
					

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
