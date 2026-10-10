extends CharacterBody2D

class_name enemigo_robot

@onready var barra_de_vida_2: ProgressBar = $Node/BarraDeVida2

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var timer: Timer = $Timer
@onready var hitman: CharacterBody2D = $Hitman
@onready var marcador: Marker2D = $Marker2D

const BALA_ROBOT = preload("uid://bijmdg1l66ksg")

var vida = 100
var player 

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Hitman")
	barra_de_vida_2.max_value = vida

func _physics_process(delta: float) -> void:
	apuntar()
	posicionHitman()
	if player: 
		look_at(player.global_position)


func apuntar():
	ray_cast_2d.target_position = to_local(player.position)

func posicionHitman():
	if ray_cast_2d.get_collider() == player and timer.is_stopped():
		timer.start()
	elif ray_cast_2d.get_collider() != player and not timer.is_stopped():
		timer.stop()
	pass


func _on_timer_timeout() -> void:
	disparar() 
	pass # Replace with function body.

func disparar():
		var instanciaDeBala = BALA_ROBOT.instantiate()
		var referencia = ray_cast_2d.get_collision_point()
		var direc = (referencia - global_position)
		
		get_tree().root.add_child(instanciaDeBala)
		instanciaDeBala.global_position = marcador.global_position
		instanciaDeBala.direction = (direc).normalized()

func terminar_juego() -> void:
	get_tree().reload_current_scene()

func recibirDaño(cantidad):
	barra_de_vida_2.value -= cantidad
	if barra_de_vida_2.value == 0:
		queue_free()
