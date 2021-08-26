extends State

"""
State interface to use in Hierarchical State Machines.

The lowest leaf tries to handle callbacks, and if it can't, it delegates the work to its parent.
"""

onready var move := get_parent()


# interface for state
func unhandled_input(_event: InputEvent) -> void:
	move.unhandled_input(_event)


func physics_process(_delta: float) -> void:
	if owner.is_on_floor():
		if move.get_move_direction().x != 0.0:
			_state_machine.transition_to("Move/Run")
	else:
		_state_machine.transition_to("Move/Air")

	## NOT needed
	#move.physics_process(_delta)


func enter(_msg: Dictionary = {}) -> void:
	move.enter(_msg)

	move.max_speed = move.max_speed_default
	move.velocity = Vector2.ZERO


func exit() -> void:
	move.exit()
