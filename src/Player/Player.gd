extends KinematicBody2D

class_name Player  # creates a Player class

# store player's dependencies
onready var state_machine: StateMachine = $StateMachine
onready var collider: CollisionShape2D = $CollisionShape2D

const FLOOR_NORMAL := Vector2.UP  # we will use this with move_and_slide logic
# we could change this later to allow player to walk on walls or the ceiling

var is_active := true setget set_is_active


# this will get called during init, before on_ready
func set_is_active(value: bool) -> void:
	is_active = value
	if not collider:
		return
	collider.disabled = not value
