extends Node

@onready var markers: Array[Marker2D] = [$Marker2D]
const ENEMIGO_ROBOT_JEFE = preload("uid://yjg8a2bcim82")

func _ready() -> void:
	for marcador in markers:
		var instanciaDeRobotJefe = ENEMIGO_ROBOT_JEFE.instantiate()
		
		instanciaDeRobotJefe.global_position = marcador.global_position
		add_child(instanciaDeRobotJefe)
