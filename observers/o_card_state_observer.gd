extends Observer
class_name CardStateObserver

func watch() -> Resource:
	return C_StateMachine

func match():
	return q.with_all([C_StateMachine, C_CardUI, \
	C_DebugColorRect, C_DebugLabel, \
	C_DropPointDetector])

func on_component_changed(
	entity: Entity, component: Resource, property: String, new_value: Variant, old_value: Variant
) -> void:
	call_deferred("update_debug_visuals", entity, component)

func update_debug_visuals(entity: Entity, component: Resource) -> void:
	var debug_color_rect_path = entity.get_component(C_DebugColorRect) as C_DebugColorRect
	var debug_color_rect = get_node(debug_color_rect_path) as ColorRect
	if !debug_color_rect:
		return
	var debug_label_path = entity.get_component(C_DebugLabel) as C_DebugLabel
	var debug_label = get_node(debug_label_path) as Label
	if !debug_label:
		return
	var state_enum = (component as C_StateMachine).current_state
	match state_enum:
		GameConstant.CardState.BASE:
			debug_label.text = "BASE"
			debug_color_rect.color = Color.WEB_GREEN
		_:
			pass
