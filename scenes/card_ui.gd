class_name CardUI
extends Control

signal reparent_requested(card_ui: CardUI)

@onready var color_rect: ColorRect = $ColorRect
@onready var label: Label = $Label
@onready var drop_point_detector: Area2D = $DropPointDetector
