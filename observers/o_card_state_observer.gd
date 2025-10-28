extends Observer
class_name CardStateObserver

func watch() -> Resource:
	return C_StateMachine

func match():
	return q.with_all([C_StateMachine, C_CardUI, \
	C_DebugColorRect, C_DebugLabel, \
	C_DropPointDetector])

func on_gui_input():
	pass

func on_component_changed(
	entity: Entity, component: Resource, property: String, new_value: Variant, old_value: Variant
) -> void:
	pass
