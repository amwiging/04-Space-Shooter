extends Node2D

export var probability = 0.4
onready var Enemy = load("res://Scenes/Enemy.tscn")

func _ready():
	randomize()

func _on_Timer_timeout():
	if randf() < probability:
		var m = Enemy.instance()
		add_child(m)
