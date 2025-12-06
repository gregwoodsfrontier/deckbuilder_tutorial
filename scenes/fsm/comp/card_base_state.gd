extends CardState
class_name CardBaseState

func enter() -> void:
	if not card_ui.is_node_ready():
		await card_ui.ready
	
	card_ui.color.colotr = Color.WEB_GREEN
	card_ui.state.text = 'BASE'
	card_ui.pivot_offset = Vector2.ZERO
