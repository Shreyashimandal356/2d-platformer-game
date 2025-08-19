extends Area2D

@export var value: int = 10

func _ready() -> void:
    body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
    if body.is_in_group("player"):
        if Engine.has_singleton("GameState"):
            GameState.add_score(value)
        queue_free()
