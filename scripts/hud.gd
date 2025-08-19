extends CanvasLayer

func _ready() -> void:
    if Engine.has_singleton("GameState"):
        GameState.score_changed.connect(_on_score_changed)
        GameState.lives_changed.connect(_on_lives_changed)
        _update_label(GameState.score, GameState.lives)

func _on_score_changed(score: int) -> void:
    _update_label(score, GameState.lives)

func _on_lives_changed(lives: int) -> void:
    _update_label(GameState.score, lives)

func _update_label(score: int, lives: int) -> void:
    var label := $Info as Label
    if label:
        label.text = "Score: %d    Lives: %d" % [score, lives]
