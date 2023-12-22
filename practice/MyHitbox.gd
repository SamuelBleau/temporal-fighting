class_name MyHitbox
extends Area2D

@export var damage := 10
@export var testpute = 100

func _init() -> void:
	collision_layer = 2
	collision_mask = 0


