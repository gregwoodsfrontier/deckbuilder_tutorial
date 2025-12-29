extends CardState

func enter() -> void:
	#card_ui.panel.set("theme_override_styles/panel", card_ui.BASE_STYLEBOX)
	card_ui.color_rect.color = Color.DARK_VIOLET
	card_ui.label.text = "RELEASED"
