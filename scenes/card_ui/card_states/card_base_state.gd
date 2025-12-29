extends CardState

func enter() -> void:
	if not card_ui.is_node_ready():
		await card_ui.ready

	#card_ui.panel.set("theme_override_styles/panel", card_ui.BASE_STYLEBOX)
	card_ui.reparent_requested.emit(card_ui)
	card_ui.color_rect.color = Color.WEB_GREEN
	card_ui.label.text = "BASE"
	card_ui.pivot_offset = Vector2.ZERO
