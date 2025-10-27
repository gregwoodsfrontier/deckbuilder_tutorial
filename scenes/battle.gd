extends Node2D

@onready var world: World = $World

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ECS.world = world
