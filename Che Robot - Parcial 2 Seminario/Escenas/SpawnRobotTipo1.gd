extends Node

@onready var markers: Array[Marker2D] = [$Marker2D, $Marker2D2, $Marker2D3,$Marker2D4, $Marker2D5, $Marker2D6, $Marker2D7, $Marker2D8, $Marker2D8, $Marker2D9, $Marker2D10 ]
const ENEMIGO_ROBOT = preload("uid://cjphuq1y2ciir")

func _ready() -> void:
	for marcador in markers:
		var instanciaDeRobot = ENEMIGO_ROBOT.instantiate()
		
		instanciaDeRobot.global_position = marcador.global_position
		add_child(instanciaDeRobot)
