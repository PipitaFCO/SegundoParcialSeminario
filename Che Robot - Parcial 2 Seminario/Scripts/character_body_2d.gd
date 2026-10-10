extends CharacterBody2D

@onready var marcador: Marker2D = $Marker2D
const BALA_ROBOT = preload("uid://bijmdg1l66ksg")

var vida = 100

const BALA = preload("uid://1ruvssw2yund")
const SPEED = 200.0

func _physics_process(delta: float) -> void:

	var direction = Input.get_vector("Izquierda", "Derecha", "Arriba", "Abajo")
	var mouse_pos = get_global_mouse_position()
	velocity = direction * SPEED 
	
	look_at(mouse_pos)
	
	move_and_slide()
	
	if Input.is_action_just_pressed("Disparar"):
		print("PUM!")
		var instanciaDeBala = BALA.instantiate()
		
		get_tree().root.add_child(instanciaDeBala)
		instanciaDeBala.global_position = marcador.global_position 
		instanciaDeBala.rotation = rotation

func terminar_juego() -> void:
	get_tree().reload_current_scene()

func die():
		queue_free()
		terminar_juego()
