extends ProgressBar

@onready var enemigo_robot: enemigo_robot = $"../.."

@export var offset: Vector2 = Vector2(-45, -25) 

func _process(_delta):
	if enemigo_robot:
		global_position = enemigo_robot.global_position + offset
