class_name CardUI
extends Control

signal reparent_requested(card_ui: CardUI)

@onready var color_rect: ColorRect = $ColorRect
@onready var label: Label = $Label
@onready var drop_point_detector: Area2D = $DropPointDetector
@onready var card_finite_state_machine: CardStateMachine = $CardStateMachine

func _ready() -> void:
	card_finite_state_machine.init(self)
	
	gui_input.connect(_on_gui_input)
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _input(event: InputEvent) -> void:
	card_finite_state_machine.on_input(event)

func _on_gui_input(event: InputEvent) -> void:
	card_finite_state_machine.on_gui_input(event)

func _on_mouse_entered() -> void:
	card_finite_state_machine.on_mouse_entered()

func _on_mouse_exited() -> void:
	card_finite_state_machine.on_mouse_exited()
