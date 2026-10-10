extends ProgressBar

@onready var personaje = get_parent().get_parent()


@export var offset: Vector2 = Vector2(-32, -35) 

var maxValorVida: int


func _ready() -> void:
	maxValorVida = 100

func recibirDaño(dañoBalaRobot):
	value -= dañoBalaRobot
	if value == 0:
		get_tree().get_nodes_in_group("Hitman")[0].die()

func _process(_delta):
	if personaje:
		global_position = personaje.global_position + offset
