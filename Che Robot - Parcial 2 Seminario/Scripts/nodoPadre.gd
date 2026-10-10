extends Node2D

@onready var character_body_2d: CharacterBody2D = $Hitman
@onready var progress_bar: ProgressBar = $Camera2D/CanvasLayer/ProgressBar


func _ready() -> void:
	progress_bar.visible = false
	print($Hitman.position)
	print("hola")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Reiniciar"):
		reiniciarJuego()
	pass

func reiniciarJuego():
	get_tree().reload_current_scene()
