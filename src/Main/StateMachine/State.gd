extends Node
class_name State, "res://assets/icons/state.svg"

"""
State interface to use in Hierarchical State Machines.

The lowest leaf tries to handle callbacks, and if it can't, it delegates the work to its parent.
"""

onready var _state_machine := _get_state_machine(self)


# interface for state
func unhandled_input(event: InputEvent) -> void:
	return


func physics_process(delta: float) -> void:
	return


func enter(msg: Dictionary = {}) -> void:
	return


func exit() -> void:
	return


# internal methods
func _get_state_machine(node: Node) -> Node:
	if node != null and not node.is_in_group("state_machine"):
		return _get_state_machine(node.get_parent())
	return node
