extends CardState

const MOUSE_Y_SNAPBACK_THRESHOLD := 138

func enter() -> void:
	card_ui.color_rect.color = Color.WEB_PURPLE
	card_ui.label.text = "AIMING"
	# Clear exisitng array targets to ensure the ones we need.
	card_ui.targets.clear()
	
	if card_ui.parent != null:
		var offset := Vector2(card_ui.parent.size.x / 2 , -card_ui.size.y / 2)
		offset.x -= card_ui.size.x / 2
		card_ui.animate_to_position(card_ui.parent.global_position + offset, 0.2)
		card_ui.drop_point_detector.monitoring =  false
		Events.card_aim_started.emit(card_ui)


func exit() -> void:
	Events.card_aim_ended.emit(card_ui)


func on_input(_event: InputEvent) -> void:
	var mouse_motion := _event is InputEventMouseMotion
	var mouse_at_bottom := card_ui.get_global_mouse_position().y > MOUSE_Y_SNAPBACK_THRESHOLD
	
	if (mouse_at_bottom and mouse_motion) or _event.is_action_pressed("right_mouse"):
		transition_requested.emit(self, CardState.STATE.BASE)
	elif _event.is_action_released("left_mouse") or _event.is_action_pressed("left_mouse"):
		get_viewport().set_input_as_handled()
		transition_requested.emit(self, CardState.STATE.RELEASED)
