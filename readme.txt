Diplomatura en desarrollo de videojuegos UNQ
Materia: Introducción a los Videojuegos / Elementos básicos de programación.

Alumno : Puentes, Kevin Eric

Docente: Tobías Moscatelli
Comisión: Virtual

Créditos a los autores: Tomé inspiración variada, mucho visionado de videos y assets para darme ideas, aprender técnicas y mejorar en estilo.

Decisiones tecnicas destacables:
			- Nombrar "metas" a lo pedido en el proyecto como "casas".
			- Se agregó un nuevo script llamado "obstaculo.gd" el cual me permite animar el sprite del obstáculo.
			- Le impuse un randomize al orden de aparición de los frames del sprite obstáculo 
				para evitar la sincronía visual.
			- Modificación en la función perder_vidas en el script hud.gd, me interesaba mostrar 
				las vidas perdidas como vidas apagadas.
			- Modificación de la UI, utilizando themes personalizados.
			- Se detiene el loop de la animación de "hit", para que de la sensación correcta.
			- Utilizar una capa extra sobre el mapa, y jugar con los niveles en el eje Z, para coherencia visual.
			- Todos los tiles fueron diseñados en 32 * 32 px y los sprites en 64 * 64 px, han sido correctamente 
				llevados a la escala que permitiera respetar las dimensiones propuestas por el proyecto.


Pruebas realizadas:
			- Juego probado en Godot 4.4.1
			- Testeado en diferentes resoluciones y formatos de ventana.
			- Se verifica que no hay errores al abrir el proyecto (main.tscn) desde el editor de Godot.
			- Tampoco hay errores o advertencias visibles al ejecutar el proyecto.


Observaciones:
			- Pude seguir cómodamente las clases y si me ha quedado alguna duda la pude resolver con 
				el revisionado de las clases mismas o con alguna búsqueda no muy exhaustiva por la web.
