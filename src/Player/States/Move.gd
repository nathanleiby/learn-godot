extends State

"""
Parent state that abstracts and handles basic movement.
Move-related children states can delegate movement to it, or use its utility functions.
"""

# configurable vars

export var max_speed_default := Vector2(500.0, 1500.0)
export var acceleration_default := Vector2(100000, 3000.0)
export var jump_impulse := 900.0  # force of the jump

# public variables

var acceleration := acceleration_default
var max_speed := max_speed_default
var velocity := Vector2.ZERO


# interface for state
func unhandled_input(event: InputEvent) -> void:
	if owner.is_on_floor() and event.is_action_pressed("jump"):
		_state_machine.transition_to("Move/Air", {impulse = jump_impulse})


func physics_process(delta: float) -> void:
	velocity = calculate_velocity(velocity, max_speed, acceleration, delta, get_move_direction())

	# owner is a generic node property
	owner.move_and_slide(velocity, owner.FLOOR_NORMAL)

	# to help with camera...
	# TODO: Setup Events global
	Events.emit_signal("player_moved", owner)


# static func cannot access properties of the class directly
static func calculate_velocity(
	old_velocity: Vector2,
	local_max_speed: Vector2,
	local_acceleration: Vector2,
	delta: float,
	move_direction: Vector2
) -> Vector2:
	var new_velocity := old_velocity
	new_velocity += move_direction * local_acceleration * delta
	new_velocity.x = clamp(new_velocity.x, -local_max_speed.x, local_max_speed.x)
	new_velocity.y = clamp(new_velocity.y, -local_max_speed.y, local_max_speed.y)
	return new_velocity


func get_move_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 1.0
	)
