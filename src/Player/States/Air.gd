extends State

# configurable in editor
export var acceleration_x := 5000.0  # give control within air

onready var move := get_parent()


# interface for state
func unhandled_input(event: InputEvent) -> void:
    move.unhandled_input(event)


func physics_process(delta: float) -> void:
    move.physics_process(delta)

    if owner.is_on_floor():
        if move.get_move_direction().x == 0.0:
            _state_machine.transition_to("Move/Idle")
        else:
            _state_machine.transition_to("Move/Run")


func enter(msg: Dictionary = {}) -> void:
    move.enter(msg)
    move.acceleration.x = acceleration_x

    # if optional keys are set...
    if "velocity" in msg:
        move.velocity = msg.velocity
        move.max_speed.x = max(abs(msg.velocity.x), move.max_speed.x)

    if "impulse" in msg:
        move.velocity += calculate_jump_velocity(msg.impulse)


func exit() -> void:
    move.exit()
    move.acceleration = move.acceleration_default

func calculate_jump_velocity(impulse := 0.0) -> Vector2:
    return move.calculate_velocity(
        move.velocity,
        move.max_speed,
        Vector2(0.0, impulse),
        # passing delta of 1 effectively ignores it
        1,
        Vector2.UP,
    )
