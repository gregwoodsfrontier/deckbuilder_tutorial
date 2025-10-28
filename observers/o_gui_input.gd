extends Observer
class_name GuiInputObserver

func watch() -> Resource:
	return C_OnGuiInput

func match() -> QueryBuilder:
	return q.with_any([C_OnGuiInput])

func on_component_added(entity: Entity, component: Resource) -> void:
	call_deferred("debug_and_remove", entity, component)

func debug_and_remove(entity: Entity, component: Resource) -> void:
	print("gui_input_on_Observer")
	var tag = component as C_OnGuiInput
	entity.remove_component(tag)
