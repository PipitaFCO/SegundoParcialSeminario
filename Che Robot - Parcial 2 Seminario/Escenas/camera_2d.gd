extends Camera2D

@onready var mapa: TileMapLayer = $"../../Background"
@onready var hitman: CharacterBody2D = $"../Hitman"
@onready var progress_bar: ProgressBar = $CanvasLayer/ProgressBar

func _physics_process(delta: float) -> void:
	position = hitman.global_position

func _ready() -> void:
	if mapa:
		progress_bar.visible = false
		var mapa_rect: Rect2i = mapa.get_used_rect()
		
		var tamaño_celda: Vector2i = mapa.tile_set.tile_size
		
		limit_left = mapa_rect.position.x * tamaño_celda.x
		limit_top = mapa_rect.position.y * tamaño_celda.y
		limit_right = mapa_rect.end.x * tamaño_celda.x
		limit_bottom = mapa_rect.end.y * tamaño_celda.y
