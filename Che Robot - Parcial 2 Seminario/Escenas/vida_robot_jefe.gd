extends ProgressBar

@onready var enemigo_robot_jefe: enemigo_robot_jefe = $"../.."

@export var offset: Vector2 = Vector2(-45, -25) 

func _process(_delta):
	if enemigo_robot_jefe:
		global_position = enemigo_robot_jefe.global_position + offset
