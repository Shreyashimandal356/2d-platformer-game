extends CharacterBody2D

@export var SPEED: float = 200.0
@export var JUMP_VELOCITY: float = -360.0
@export var GRAVITY: float = 900.0
@export var ACCELERATION: float = 800.0
@export var FRICTION: float = 1200.0

var start_position: Vector2
var invulnerable_time := 0.0
const INVULN_DURATION := 0.8

func _ready() -> void:
    start_position = global_position
    add_to_group("player")

func _physics_process(delta: float) -> void:
    if not is_on_floor():
        velocity.y += GRAVITY * delta

    var dir := Input.get_axis("ui_left", "ui_right")
    if dir != 0:
        velocity.x = move_toward(velocity.x, dir * SPEED, ACCELERATION * delta)
    else:
        velocity.x = move_toward(velocity.x, 0.0, FRICTION * delta)

    if Input.is_action_just_pressed("ui_accept") and is_on_floor():
        velocity.y = JUMP_VELOCITY

    if invulnerable_time > 0.0:
        invulnerable_time -= delta

    move_and_slide()

func bounce() -> void:
    # Called when stomping an enemy
    velocity.y = JUMP_VELOCITY * 0.6

func take_hit() -> void:
    if invulnerable_time > 0.0:
        return
    invulnerable_time = INVULN_DURATION
    if Engine.has_singleton("GameState"):
        GameState.lose_life()
    # Simple respawn at start, zero velocity
    global_position = start_position
    velocity = Vector2.ZERO
