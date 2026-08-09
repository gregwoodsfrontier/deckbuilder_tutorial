extends Node2D

const ARC_POINTS := 8

var targeting := false
var current_card: CardUI
	
@onready var card_arc: Line2D = $CanvasLayer/CardArc
@onready var area_2d: Area2D = $Area2D

func _ready() -> void:
	Events.card_aim_started.connect(_on_card_aim_started)
	Events.card_aim_ended.connect(_on_card_aim_ended)
	area_2d.area_entered.connect(_on_area_2d_entered)
	area_2d.area_exited.connect(_on_area_2d_exited)


func _process(delta: float) -> void:
	if not targeting:
		return
	
	area_2d.position = get_local_mouse_position()
	card_arc.points = _get_points()


func _on_area_2d_entered(_area: Area2D) -> void:
	if not current_card or not targeting:
		return
	
	if not current_card.targets.has(_area):
		current_card.targets.append(_area)


func _on_area_2d_exited(_area: Area2D) -> void:
	if not current_card or not targeting:
		return
	
	current_card.targets.erase(_area)


func _on_card_aim_started(_card_ui: CardUI) -> void:
	if not _card_ui.card.is_single_targeted():
		return
	
	targeting = true
	area_2d.monitoring = true
	area_2d.monitorable = true
	current_card = _card_ui


func _on_card_aim_ended(_card_ui: CardUI) -> void:
	targeting = false
	area_2d.monitoring = false
	area_2d.monitorable = false
	current_card = null
	card_arc.clear_points()
	area_2d.position = Vector2.ZERO


func _get_points() -> Array[Vector2]:
	var points := []
	var start := current_card.global_position + Vector2(current_card.size.x / 2, 0)
	var target := get_local_mouse_position()
	var distance := target - start
	
	for i in range(ARC_POINTS):
		var t := (1.0 / ARC_POINTS) * i
		var x := start.x + (distance.x / ARC_POINTS) * i
		var y := start.y + ease_out_cubic(t) * distance.y
		points.append(Vector2(x, y))
	
	points.append(target)
	return points


func ease_out_cubic(t: float) -> float:
	return 1.0 - pow(1.0 - t, 3.0)
