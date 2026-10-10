extends CharacterBody2D

class_name enemigo_robot_jefe

@onready var timer2: Timer = $Timer2

@onready var vida_robot_jefe = get_tree().get_first_node_in_group("BarraDeVidaRobotJefe")

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var timer: Timer = $Timer
@onready var hitman: CharacterBody2D = $"."
@onready var marcador: Marker2D = $Marker2D

const BALA_ROBOT = preload("uid://bijmdg1l66ksg")

var vida = 1000
var player

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Hitman")
	vida_robot_jefe.max_value = vida
	vida_robot_jefe.value = vida


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
	pass 

func disparar():
		var instanciaDeBala = BALA_ROBOT.instantiate()
		var referencia = ray_cast_2d.get_collision_point()
		var direc = (referencia - global_position)
		
		get_tree().root.add_child(instanciaDeBala)
		instanciaDeBala.global_position = (marcador.global_position - instanciaDeBala.global_position)
		instanciaDeBala.direction = (direc).normalized()

func terminar_juego() -> void:
	get_tree().reload_current_scene()

func recibirDaño(cantidad):
	vida_robot_jefe.value -= cantidad
	if vida_robot_jefe.value == 0:
		queue_free()
