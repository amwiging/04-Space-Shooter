extends RigidBody2D

export var speed = 500
onready var Splat = load("res://Scenes/Splat.tscn")
onready var Player = get_node("/root/Game/Player")

func _ready():
	contact_monitor = true
	set_max_contacts_reported(4)
	
func _physics_process(delta):
	var colliding = get_colliding_bodies()
	for c in colliding:
		var splat = Splat.instance()
		splat.position = position
		splat.get_node("Sprite").playing = true
		get_node("/root/Game/Splatters").add_child(splat)
		queue_free()
		
	if position.y < -10:
		queue_free()
	
func _integrate_forces(state):
	state.set_linear_velocity(Vector2(0,-speed))
	state.set_angular_velocity(0)
