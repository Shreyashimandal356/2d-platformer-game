extends Area2D

@export var left_limit: float = -100.0
@export var right_limit: float = 100.0
@export var speed: float = 60.0
var direction := -1.0

func _ready() -> void:
    body_entered.connect(_on_body_entered)

func _physics_process(delta: float) -> void:
    position.x += speed * direction * delta
    if position.x <= left_limit:
        position.x = left_limit
        direction = 1.0
    elif position.x >= right_limit:
        position.x = right_limit
        direction = -1.0

func _on_body_entered(body: Node) -> void:
    if not body.is_in_group("player"):
        return
    # If player is falling and above the enemy, the enemy is defeated.
    if "velocity" in body and body.velocity.y > 0.0 and body.global_position.y < global_position.y - 4.0:
        queue_free()
        if Engine.has_singleton("GameState"):
            GameState.add_score(100)
        if "bounce" in body:
            body.bounce()
    else:
        if "take_hit" in body:
            body.take_hit()
