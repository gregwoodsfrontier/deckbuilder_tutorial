extends CardState

var played: bool

func enter() -> void:
	#card_ui.panel.set("theme_override_styles/panel", card_ui.BASE_STYLEBOX)
	card_ui.color_rect.color = Color.DARK_VIOLET
	card_ui.label.text = "RELEASED"
	
	played = false
	
	if not card_ui.targets.is_empty():
		played = true
		print("play card for target(s): ", card_ui.targets)

func on_input(_event: InputEvent) -> void:
	if played:
		return
	
	transition_requested.emit(self, CardState.STATE.BASE)
