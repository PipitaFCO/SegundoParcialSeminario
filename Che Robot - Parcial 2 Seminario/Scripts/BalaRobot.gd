extends Area2D

var direction: Vector2 = Vector2.ZERO
const SPEED = 300
var dañoBalaRobot = 10

func _physics_process(delta: float) -> void:
	position += direction  * SPEED * delta 
	pass

func direcRumbo(direc_inicial: Vector2) -> void:
	direction = direc_inicial.normalized()
	rotation = direction.angle()
	

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Hitman":
		get_tree().get_nodes_in_group("barraVidaHitman")[0].recibirDaño(20)
		queue_free()
		
	if body.name == "ParedPisoCasa":
		queue_free()
	pass 
