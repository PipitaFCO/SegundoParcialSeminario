extends Node2D

var velocidad: float = 800.0
var direc: Vector2 = Vector2.ZERO
var dañoBala: int = 20
const SPEED = 500

func _process(delta: float) -> void:
	position += transform.x * SPEED * delta 
	pass

func direcRumbo(direc_inicial: Vector2) -> void:
	direc = direc_inicial.normalized()
	rotation = direc.angle()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Robot"):
		body.recibirDaño(dañoBala)
		queue_free()
	elif body.is_in_group("RobotJefe"):
		body.recibirDaño(dañoBala)
		queue_free()
	if body.name == "ParedPisoCasa":
		queue_free()
	if body.name == "DecoracionCasa":
		queue_free()
	pass 
