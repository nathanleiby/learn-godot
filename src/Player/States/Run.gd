extends State

"""
State interface to use in Hierarchical State Machines.

The lowest leaf tries to handle callbacks, and if it can't, it delegates the work to its parent.
"""

onready var move := get_parent()


# interface for state
func unhandled_input(event: InputEvent) -> void:
	move.unhandled_input(event)


func physics_process(delta: float) -> void:
	if owner.is_on_floor():
		if move.get_move_direction().x == 0.0:
			_state_machine.transition_to("Move/Idle")
	else:
		_state_machine.transition_to("Move/Air")

	move.physics_process(delta)


func enter(msg: Dictionary = {}) -> void:
	move.enter(msg)


func exit() -> void:
	move.exit()
