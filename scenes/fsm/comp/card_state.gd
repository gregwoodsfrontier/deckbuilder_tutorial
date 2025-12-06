extends Node
class_name CardState

enum STATE {BASE, CLICKED, DRAGGING, AIMING, RELEASED}

signal transition_requested(from: CardState, to: CardState)

@export var state: STATE
var card_ui: CardUI

func _init(new_card_ui: CardUI) -> void:
	card_ui = new_card_ui

func enter() -> void:
	pass

func exit() -> void:
	pass

func on_input(_event: InputEvent) -> void:
	pass

func on_gui_input(_event: InputEvent) -> void:
	pass

func on_mouse_entered() -> void:
	pass

func on_mouse_exited() -> void:
	pass
