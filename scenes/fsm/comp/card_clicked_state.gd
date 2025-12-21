extends CardState
class_name CardClickedState

func enter() -> void:	
	card_ui.color.colotr = Color.ORANGE
	card_ui.state.text = 'CLICKED'
	card_ui.drop_point_detector.monitoring = true

func on_input(_event: InputEvent) -> void:
	if _event is InputEventMouseMotion:
		transition_requested.emit(self, CardState.STATE.DRAGGING)
