extends Area2D

@export var zoom_lejano: Vector2 = Vector2(1.1, 1.1) # más lejos
@export var zoom_normal: Vector2 = Vector2(1.0, 1.0) # normal
@export var duracion_transicion: float = 1.0
@onready var camaraJefe: Camera2D = $"../Camera2D"
@onready var progress_bar: ProgressBar = $"../Camera2D/CanvasLayer/ProgressBar"


var tween: Tween

func _on_body_entered(body) -> void:
	if body.is_in_group("Hitman"):
		cambiar_zoom(zoom_lejano)
		progress_bar.visible = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Hitman"):
		cambiar_zoom(zoom_normal)
		progress_bar.visible = true

func cambiar_zoom(nuevo_zoom: Vector2) -> void:
	var camara: Camera2D = get_viewport().get_camera_2d()
	if camara == null:
		return

	if tween and tween.is_running():
		tween.kill()

	tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(camara, "zoom", nuevo_zoom, duracion_transicion)
